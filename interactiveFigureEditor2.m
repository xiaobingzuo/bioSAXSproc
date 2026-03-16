function interactiveFigureEditor2(fig)
% interactiveFigureEditor
% Click-based interactive figure editing in MATLAB
%
% Features:
% - Left-click on line: edit line properties (width, color, style, marker)
% - Left-click on axes: edit axes properties (limits, ticks, scale, font, axis width)
% - Left-click on blank axes area: add draggable annotation
% - Legend management: add using line labels, edit text, or turn off
% - Right-click: exit editor
%
% == Mouse actions ==
% Action	            Result
% Left click on line	Edit line width, color, style, marker
% Left click on axes	Edit x/y limits, log/linear scale, font
% Left-click on blank axes area: add draggable annotation
% Right click	        Exit editor
% Legend management: add using line labels, edit text, or turn off
%
% example:
% plot(x, y1, x, y2)
% interactiveFigureEditor2

if nargin < 1 || isempty(fig)
    fig = gcf;
end

disp('Interactive Figure Editor ON');
disp('Left-click: edit object / add annotation | Right-click: exit');

set(fig, 'WindowButtonDownFcn', @mouseClick);

% Keep track of added annotations for dragging
annotations = gobjects(0);

    function mouseClick(~, ~)
        clickType = fig.SelectionType;
        
        % Right-click → exit
        if strcmp(clickType, 'alt')
            set(fig, 'WindowButtonDownFcn', '');
            disp('Interactive Figure Editor OFF');
            return
        end
        
        obj = hittest(fig);
        ax = gca;

        % Determine click type
        if isempty(obj) || ~isvalid(obj)
            % Blank axes → add annotation
            addAnnotation(ax);
            return
        end

        switch class(obj)
            case 'matlab.graphics.axis.Axes'
                editAxes(obj);

            case 'matlab.graphics.chart.primitive.Line'
                editLine(obj);

            case 'matlab.graphics.text.Text'
                % Start dragging annotation
                dragAnnotation(obj);

            otherwise
                % Try parent axes
                axParent = ancestor(obj, 'axes');
                if ~isempty(axParent)
                    editAxes(axParent);
                else
                    addAnnotation(ax);
                end
        end
    end

%% ==================== AXES EDITOR ====================
function editAxes(ax)
    prompt = { ...
        'XLim (e.g. [0 10])', ...
        'YLim (e.g. [0 10])', ...
        'XTick (e.g. [0 2 4 6 8 10] or [])', ...
        'YTick (e.g. [0 2 4 6 8 10] or [])', ...
        'XScale (linear/log)', ...
        'YScale (linear/log)', ...
        'Tick Font Size', ...
        'Font Name', ...
        'X-axis line width', ...
        'Y-axis line width', ...
        'Legend: add/edit/none (type "add", "edit", or "off")'};

    default = { ...
        mat2str(ax.XLim), ...
        mat2str(ax.YLim), ...
        mat2str(ax.XTick), ...
        mat2str(ax.YTick), ...
        ax.XScale, ...
        ax.YScale, ...
        num2str(ax.FontSize), ...
        ax.FontName, ...
        num2str(ax.LineWidth), ...
        num2str(ax.LineWidth), ...
        'add'};

    answer = inputdlg(prompt, 'Edit Axes', 1, default);
    if isempty(answer), return, end

    try
        % Limits
        ax.XLim = str2num(answer{1}); %#ok<ST2NM>
        ax.YLim = str2num(answer{2}); %#ok<ST2NM>

        % Ticks
        xt = str2num(answer{3}); %#ok<ST2NM>
        yt = str2num(answer{4}); %#ok<ST2NM>
        if isempty(xt), ax.XTickMode = 'auto'; else, ax.XTick = xt; end
        if isempty(yt), ax.YTickMode = 'auto'; else, ax.YTick = yt; end

        % Scales
        ax.XScale = answer{5};
        ax.YScale = answer{6};

        % Fonts
        ax.FontSize = str2double(answer{7});
        ax.FontName = answer{8};

        % Axis line width (max of X/Y)
        ax.LineWidth = max([str2double(answer{9}), str2double(answer{10})]);
        ax.Box = 'on';

        % Legend
        legendOption = lower(answer{11});
        lines = findall(ax, 'Type', 'line');
        switch legendOption
            case 'add'
                labels = get(lines, 'DisplayName');
                % If only one line, make it a cell
                if ~iscell(labels), labels = {labels}; end
                % Prompt user to confirm or edit labels
                answerLegend = inputdlg('Legend labels (comma-separated):', ...
                                        'Legend', 1, {strjoin(labels, ', ')});
                if ~isempty(answerLegend)
                    lbls = strtrim(strsplit(answerLegend{1}, ','));
                    legend(ax, lines, lbls);
                end
            case 'edit'
                lg = legend(ax);
                if ~isempty(lg), answerLegend = inputdlg('Edit legend text (comma-separated):', ...
                                'Legend', 1, {strjoin(lg.String, ', ')}); 
                    if ~isempty(answerLegend)
                        lg.String = strtrim(strsplit(answerLegend{1}, ','));
                    end
                end
            case 'off'
                legend(ax, 'off');
        end

    catch
        errordlg('Invalid axes settings', 'Error');
    end
end

%% ==================== LINE EDITOR ====================
function editLine(ln)
    prompt = { ...
        'Line Width', ...
        'Color [r g b]', ...
        'Line Style (- -- : -.)', ...
        'Marker (o + * . x s d ^ v > < none)'};

    default = { ...
        num2str(ln.LineWidth), ...
        mat2str(ln.Color), ...
        ln.LineStyle, ...
        ln.Marker};

    answer = inputdlg(prompt, 'Edit Line', 1, default);
    if isempty(answer), return, end

    try
        ln.LineWidth = str2double(answer{1});
        ln.Color     = str2num(answer{2}); %#ok<ST2NM>
        ln.LineStyle = answer{3};
        ln.Marker    = answer{4};
    catch
        errordlg('Invalid line settings', 'Error');
    end
end

%% ==================== ADD ANNOTATION ====================
function addAnnotation(ax)
    cp = ax.CurrentPoint;
    x = cp(1,1);
    y = cp(1,2);

    txt = inputdlg('Annotation text:', 'Add Annotation', 1, {''});
    if isempty(txt), return, end

    t = text(ax, x, y, txt{1}, 'FontSize', 12, ...
             'Color', 'k', 'VerticalAlignment', 'bottom', ...
             'HorizontalAlignment', 'left', 'Interpreter', 'none', ...
             'ButtonDownFcn', @(src,evnt) dragAnnotation(src));
end

%% ==================== DRAG ANNOTATION ====================
function dragAnnotation(txtObj)
    fig.WindowButtonMotionFcn = @(src,evnt) moveText(txtObj);
    fig.WindowButtonUpFcn     = @(src,evnt) stopDrag();

    function moveText(txtObj)
        cp = ax.CurrentPoint;
        txtObj.Position(1:2) = cp(1,1:2); % move annotation
    end

    function stopDrag()
        fig.WindowButtonMotionFcn = '';
        fig.WindowButtonUpFcn     = '';
    end
end

end