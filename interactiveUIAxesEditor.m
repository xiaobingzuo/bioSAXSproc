function interactiveUIAxesEditor(app, ax)
% INTERACTIVEUIAXESEDITOR Make a UIAxes interactive in App Designer
%
% Usage: interactiveUIAxesEditor(app, app.UIAxes)
%
% Features:
% - Left-click line: edit line properties
% - Left-click axes background: edit axes properties
% - Left-click blank space: add draggable annotation
% - Drag annotation by clicking text
% - Manage legend: add from line labels, edit, or turn off
%
% Example:
% Example in a Button callback or startupFcn:
% x = 0:0.1:10;
% y1 = sin(x); y2 = cos(x);
% 
% plot(app.UIAxes, x, y1, x, y2, 'DisplayName', {'sin(x)','cos(x)'});
% 
% interactiveUIAxesEditor(app, app.UIAxes)

%fig = app.UIFigure;
fig = ancestor(ax, 'figure');

disp('Interactive UIAxes Editor ON');
disp('Left-click: edit object / add annotation | Right-click: exit');

% Store annotations
annotations = gobjects(0);

% Assign figure mouse callback
fig.WindowButtonDownFcn = @(src, evnt) mouseClickApp(app, ax);

% ==================== MOUSE CLICK CALLBACK ====================
    function mouseClickApp(app, ax)
        clickType = fig.SelectionType;

        % Right-click → exit editor
        if strcmp(clickType, 'alt')
            fig.WindowButtonDownFcn = [];
            fig.WindowButtonMotionFcn = [];
            fig.WindowButtonUpFcn = [];
            disp('Interactive UIAxes Editor OFF');
            return
        end

        obj = hittest(fig);

        % If blank click → add annotation
        if isempty(obj) || ~isvalid(obj) || isa(obj,'matlab.graphics.axis.Axes')
            % Check if click is inside our UIAxes
            cp = ax.CurrentPoint;
            x = cp(1,1); y = cp(1,2);
            addAnnotation(ax, x, y);
            return
        end

        % Line clicked
        if isa(obj, 'matlab.graphics.chart.primitive.Line')
            editLine(obj);
            return
        end

        % Annotation clicked (text)
        if isa(obj, 'matlab.graphics.text.Text')
            dragAnnotation(obj, ax);
            return
        end

        % Axes background clicked
        parentAx = ancestor(obj,'axes');
        if ~isempty(parentAx) && parentAx == ax
            editAxes(ax);
        end
    end

%% ==================== ADD ANNOTATION ====================
    function addAnnotation(ax, x, y)
        txt = inputdlg('Annotation text:', 'Add Annotation', 1, {''});
        if isempty(txt), return; end
        t = text(ax, x, y, txt{1}, 'FontSize',12, 'Color','k', ...
            'VerticalAlignment','bottom', 'HorizontalAlignment','left', ...
            'Interpreter','none', ...
            'ButtonDownFcn', @(src,evnt) dragAnnotation(src, ax));
        annotations(end+1) = t; %#ok<AGROW>
    end

%% ==================== DRAG ANNOTATION ====================
    function dragAnnotation(txtObj, ax)
        fig.WindowButtonMotionFcn = @(src,evnt) moveText(txtObj, ax);
        fig.WindowButtonUpFcn     = @(src,evnt) stopDrag();
    end

    function moveText(txtObj, ax)
        cp = ax.CurrentPoint;
        txtObj.Position(1:2) = cp(1,1:2);
    end

    function stopDrag()
        fig.WindowButtonMotionFcn = [];
        fig.WindowButtonUpFcn = [];
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
        if isempty(answer), return; end
        try
            ln.LineWidth = str2double(answer{1});
            ln.Color = str2num(answer{2}); %#ok<ST2NM>
            ln.LineStyle = answer{3};
            ln.Marker = answer{4};
        catch
            errordlg('Invalid line properties','Error');
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
            'Axis Line Width', ...
            'Legend: add/edit/none (type "add","edit","off")'};

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
            'add'};

        answer = inputdlg(prompt,'Edit Axes',1,default);
        if isempty(answer), return; end

        try
            % Limits
            ax.XLim = str2num(answer{1}); %#ok<ST2NM>
            ax.YLim = str2num(answer{2}); %#ok<ST2NM>

            % Ticks
            xt = str2num(answer{3}); %#ok<ST2NM>
            yt = str2num(answer{4}); %#ok<ST2NM>
            if isempty(xt), ax.XTickMode = 'auto'; else, ax.XTick = xt; end
            if isempty(yt), ax.YTickMode = 'auto'; else, ax.YTick = yt; end

            % Scale
            ax.XScale = answer{5};
            ax.YScale = answer{6};

            % Fonts
            ax.FontSize = str2double(answer{7});
            ax.FontName = answer{8};

            % Axis line width
            ax.LineWidth = str2double(answer{9});
            ax.Box = 'on';

            % Legend management
            legendOption = lower(answer{10});
            lines = findall(ax,'Type','line');
            switch legendOption
                case 'add'
                    % Use existing DisplayName
                    labels = get(lines,'DisplayName');
                    if ~iscell(labels), labels = {labels}; end
                    legend(ax,lines,labels);
                case 'edit'
                    lg = legend(ax);
                    if ~isempty(lg)
                        answerLegend = inputdlg('Edit legend text (comma-separated):', ...
                            'Legend', 1, {strjoin(lg.String,',')});
                        if ~isempty(answerLegend)
                            lg.String = strtrim(strsplit(answerLegend{1},','));
                        end
                    end
                case 'off'
                    legend(ax,'off');
            end

        catch
            errordlg('Invalid axes properties','Error');
        end
    end

end