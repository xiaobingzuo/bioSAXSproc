function interactiveFigureEditor(fig)
% interactiveFigureEditor
% Click-based interactive figure editing in MATLAB
%
% Left click  on axes  → edit axes properties
% Left click  on line  → edit line properties
% Right click anywhere → exit editor
%
% == Mouse actions ==
% Action	Result
% Left click on line	Edit line width, color, style, marker
% Left click on axes	Edit x/y limits, log/linear scale, font
% Right click	        Exit editor
%
% example:
% plot(x, y1, x, y2)
% interactiveFigureEditor

    if nargin < 1 || isempty(fig)
        fig = gcf;
    end

    disp('Interactive Figure Editor ON');
    disp('Left click: edit object | Right click: exit');

    set(fig, 'WindowButtonDownFcn', @mouseClick);

    function mouseClick(~, ~)
        clickType = fig.SelectionType;

        % Exit editor
        if strcmp(clickType, 'alt')
            set(fig, 'WindowButtonDownFcn', '');
            disp('Interactive Figure Editor OFF');
            return
        end

        obj = hittest(fig);
        if isempty(obj) || ~isvalid(obj)
            return
        end

        switch class(obj)
            case 'matlab.graphics.axis.Axes'
                editAxes(obj)

            case 'matlab.graphics.chart.primitive.Line'
                editLine(obj)

            otherwise
                ax = ancestor(obj, 'axes');
                if ~isempty(ax)
                    editAxes(ax)
                end
        end
    end
end

% ========================= AXES EDITOR =========================
function editAxes(ax)

    prompt = { ...
        'XLim (e.g. [0 10])', ...
        'YLim (e.g. [1e-3 1])', ...
        'XTick (e.g. [0 2 4 6 8 10] or [])', ...
        'YTick (e.g. [0.01 0.1 1] or [])', ...
        'XScale (linear/log)', ...
        'YScale (linear/log)', ...
        'Tick Font Size', ...
        'Font Name', ...
        'X-axis line width', ...
        'Y-axis line width'};

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
        num2str(ax.LineWidth)};

    answer = inputdlg(prompt, 'Edit Axes', 1, default);
    if isempty(answer), return, end

    try
        % Limits
        ax.XLim = str2num(answer{1}); %#ok<ST2NM>
        ax.YLim = str2num(answer{2}); %#ok<ST2NM>

        % Ticks (empty → auto)
        xt = str2num(answer{3}); %#ok<ST2NM>
        yt = str2num(answer{4}); %#ok<ST2NM>
        if isempty(xt)
            ax.XTickMode = 'auto';
        else
            ax.XTick = xt;
        end
        if isempty(yt)
            ax.YTickMode = 'auto';
        else
            ax.YTick = yt;
        end

        % Scales
        ax.XScale = answer{5};
        ax.YScale = answer{6};

        % Fonts
        ax.FontSize = str2double(answer{7});
        ax.FontName = answer{8};

        % Axis line widths (X and Y independently)
        ax.LineWidth = max([str2double(answer{9}), ...
                            str2double(answer{10})]);

        % Make sure box is on so both axes are visible
        ax.Box = 'on';

    catch
        errordlg('Invalid axes settings', 'Error');
    end
end

% ========================= LINE EDITOR =========================
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