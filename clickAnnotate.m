function clickAnnotate(fig)
% clickAnnotate  Add text annotations to a figure by mouse clicks
%
% Usage:
%   clickAnnotate              % use current figure
%   clickAnnotate(figHandle)   % specify figure
%
% Left click  : add annotation
% Right click: stop annotation mode

    if nargin < 1 || isempty(fig)
        fig = gcf;
    end

    ax = gca;
    disp('Left click to add annotation. Right click to exit.');

    set(fig, 'WindowButtonDownFcn', @mouseClick);

    function mouseClick(~, ~)
        clickType = get(fig, 'SelectionType');

        % Right click exits
        if strcmp(clickType, 'alt')
            set(fig, 'WindowButtonDownFcn', '');
            disp('Annotation mode exited.');
            return
        end

        % Get clicked data coordinates
        cp = ax.CurrentPoint;
        x = cp(1,1);
        y = cp(1,2);

        % Ask user for annotation text
        answer = inputdlg('Annotation text:', ...
                          'Add Annotation', 1, {''});
        if isempty(answer)
            return
        end

        % Add text annotation
        text(ax, x, y, answer{1}, ...
            'FontSize', 12, ...
            'Color', 'k', ...
            'VerticalAlignment', 'bottom', ...
            'HorizontalAlignment', 'left', ...
            'Interpreter', 'none');
    end
end