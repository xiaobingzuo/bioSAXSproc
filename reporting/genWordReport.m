classdef genWordReport
    properties
        ActXWord ='';
        WordHandle='';
% modified from WriteToWordFromMatlab.m
% https://www.mathworks.com/matlabcentral/fileexchange/9112-writetowordfrommatlab?s_tid=ta_fx_results
% Usage:  myObj = genWordReport;
%         myObj.WriteToWorFromMatlab
%         myObj.OtherFun();
    methods 
        function WriteToWordFromMatlab(obj)
        % -------------------------------------------------------------------
        % File: WriteToWordFromMatlab
        % Descr:  This is an example of how to control MS-Word from Matlab.
        %         With the subfunctions below it is simple to automatically
        %         let Matlab create reports in MS-Word.
        %         This example copies two Matlab figures into MS-Word, writes
        %         some text and inserts a table.
        %         Works with MS-Word 2003 at least.
        %         Reported to work with later versions of MS-Word as well.
        %         MS-Word developer reference:
        %         https://msdn.microsoft.com/en-us/library/office/ff837519.aspx
        % Created: 2005-11-22 Andreas Karlsson
        % History:
        % 051122  AK  Modification of 'save2word' in Mathworks File Exchange   
        % 060204  AK  Updated with WordSymbol, WordCreateTable and "Flying Start" section 
        % 060214  AK  Pagenumber, font color and TOC added
        % 161024  AK  v1.3 Changed calls to color-method into colorIndex to support MS-Word 2013. Thanks Martin van de Ven!
        % -------------------------------------------------------------------

            WordFileName='TestDoc.doc';
            CurDir=pwd;
            FileSpec = fullfile(CurDir,WordFileName);
            [ActXWord,WordHandle]=obj.StartWord(FileSpec);

            fprintf('Document will be saved in %s\n',FileSpec);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        %Section 1
            %%create header in word        
            Style='Heading 1'; %NOTE! if you are NOT using an English version of MSWord you get
            % an error here. For Swedish installations use 'Rubrik 1'. 
            TextString='Example of Report Generation from Matlab';
            obj.WordText(ActXWord,TextString,Style,[0,2]);%two enters after text

            Style='Normal';
            TextString='This is a simple example created by Andreas Karlsson, Sweden. ';    
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text
            TextString='Updated a cloudy day, in October 2016, with 7 ';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            obj.WordSymbol(ActXWord,176);%176 is the degree-symbol
            TextString='C. ';
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text

            TextString='The script will just insert a table and two figures into this document. ';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString='Last section is a short introduction for the interested users out there. ';
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text

            TextString='My intention with this demo is to encourage you to let your powerful computer do the';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString=' "monkey-job" such as inserting figures into MS-Word and writing standard reports. ';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString='Hopefully these simple lines will help you getting more time for funny coding';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString=' and problem solving, increasing productivity in other words ';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString='by spending less time in Microsoft Office programs. ';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter

            TextString='Happy coding!';
            obj.WordText(ActXWord,TextString,Style,[1,1]);%enter before and after text    
            ActXWord.Selection.InsertBreak; %pagebreak
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        %Section 3
            style='Heading 1';
            text='Table of Contents';
            obj.WordText(ActXWord,text,style,[1,1]);%enter before and after text 
            obj.WordCreateTOC(ActXWord,1,3);
            ActXWord.Selection.InsertBreak; %pagebreak

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        %Section 3
            style='Heading 1';
            text='Data From Matlab';
            obj.WordText(ActXWord,text,style,[1,1]);%enter before and after text 

            Style='Heading 2';
            TextString='The Self-Explaining Table';
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text
            %the obvious data
            DataCell={'Test 1', num2str(0.3) ,'Pass';
                      'Test 2', num2str(1.8) ,'Fail'};
            [NoRows,NoCols]=size(DataCell);          
            %create table with data from DataCell
            obj.WordCreateTable(ActXWord,NoRows,NoCols,DataCell,1);%enter before table

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %Section 4
            figure;plot([1:10]);title('Figure 1');xlabel('Time [s]');ylabel('Amplitude [A]')     
            %insert the figure
            TextString='First figure';
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text
            obj.FigureIntoWord(ActXWord); 

            TextString='Second figure';
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text  
            figure;plot([1:19],[1:10,9:-1:1]);title('Figure 2');xlabel('Time [s]');ylabel('Amplitude [A]');%legend('Signal 1',2);
            obj.FigureIntoWord(ActXWord); 
            ActXWord.Selection.InsertBreak; %pagebreak

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        %Section 5
            Style='Heading 1';
            TextString='Flying Start';
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text
            Style='Normal';
            TextString='Find out how to do new things in MS-Word by using the "Record Macro"-function ';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString='and look at the Visual Basic commands used.';
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text

            TextString='In Matlab you find the available properties by using get(ActXWord), for top interface,';
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString=' and further on with for example get(ActXWord.Selection).';     
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text

            TextString='Then find the methods usable from Matlab by using the invoke-function in Matlab '; 
            obj.WordText(ActXWord,TextString,Style,[0,0]);%no enter
            TextString='e.g. invoke(ActXWord.Selection). See the output of that call below. ';     
            obj.WordText(ActXWord,TextString,Style,[0,1]);%enter after text

            TextString='Set a breakpoint here and play around with these commands...'; 
            obj.WordText(ActXWord,TextString,Style,[0,1],'wdRed');%red text and enter after text

            %Make a long list of some of the methods available in MS-Word
            Category='Selection'; % Category='ActiveDocument';
            obj.PrintMethods(ActXWord,Category)

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
        %add pagenumbers (0=not on first page)
            obj.WordPageNumbers(ActXWord,'wdAlignPageNumberRight');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
            %Last thing is to replace the Table of Contents so all headings are
            %included.
            %Selection.GoTo What:=wdGoToField, Which:=wdGoToPrevious, Count:=1, Name:= "TOC"
            obj.WordGoTo(ActXWord,7,3,1,'TOC',1);%%last 1 to delete the object
            obj.WordCreateTOC(ActXWord,1,3);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
            obj.CloseWord(ActXWord,WordHandle,FileSpec);    
            close all;
        %%return
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % SUB-FUNCTIONS
        % Creator Andreas Karlsson; andreas_k_se@yahoo.com
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function [actx_word,word_handle]=StartWord(obj, word_file_p)
            % Start an ActiveX session with Word:
            actx_word = actxserver('Word.Application');
            actx_word.Visible = true;
            trace(actx_word.Visible);  
            if ~exist(word_file_p,'file')
                % Create new document:
                word_handle = invoke(actx_word.Documents,'Add');
            else
                % Open existing document:
                word_handle = invoke(actx_word.Documents,'Open',word_file_p);
            end   
            
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function WordGoTo(obj,actx_word_p,what_p,which_p,count_p,name_p,delete_p)
            %Selection.GoTo(What,Which,Count,Name)
            actx_word_p.Selection.GoTo(what_p,which_p,count_p,name_p);
            if(delete_p)
                actx_word_p.Selection.Delete;
            end

        %return
        end

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function WordCreateTOC(obj,actx_word_p,upper_heading_p,lower_heading_p)
        %      With ActiveDocument
        %         .TablesOfContents.Add Range:=Selection.Range, RightAlignPageNumbers:= _
        %             True, UseHeadingStyles:=True, UpperHeadingLevel:=1, _
        %             LowerHeadingLevel:=3, IncludePageNumbers:=True, AddedStyles:="", _
        %             UseHyperlinks:=True, HidePageNumbersInWeb:=True, UseOutlineLevels:= _
        %             True
        %         .TablesOfContents(1).TabLeader = wdTabLeaderDots
        %         .TablesOfContents.Format = wdIndexIndent
        %     End With
            actx_word_p.ActiveDocument.TablesOfContents.Add(actx_word_p.Selection.Range,1,...
                upper_heading_p,lower_heading_p);

            actx_word_p.Selection.TypeParagraph; %enter  
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function WordText(obj, actx_word_p,text_p,style_p,enters_p,color_p)
            %VB Macro
            %Selection.TypeText Text:="Test!"
            %in Matlab
            %set(word.Selection,'Text','test');
            %this also works
            %word.Selection.TypeText('This is a test');    
            if(enters_p(1))
                actx_word_p.Selection.TypeParagraph; %enter
            end
            actx_word_p.Selection.Style = style_p;
            %if(nargin == 5)%check to see if color_p is defined
            if(nargin == 6)%check to see if color_p is defined
                actx_word_p.Selection.Font.ColorIndex=color_p;     
            end

            actx_word_p.Selection.TypeText(text_p);
            actx_word_p.Selection.Font.ColorIndex='wdAuto';%set back to default color
            for k=1:enters_p(2)    
                actx_word_p.Selection.TypeParagraph; %enter
            end
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function WordSymbol(obj, actx_word_p,symbol_int_p)
            % symbol_int_p holds an integer representing a symbol, 
            % the integer can be found in MSWord's insert->symbol window    
            % 176 = degree symbol
            actx_word_p.Selection.InsertSymbol(symbol_int_p);
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function WordCreateTable(obj,actx_word_p,nr_rows_p,nr_cols_p,data_cell_p,enter_p) 
            %Add a table which auto fits cell's size to contents
            if(enter_p(1))
                actx_word_p.Selection.TypeParagraph; %enter
            end
            %create the table
            %Add = handle Add(handle, handle, int32, int32, Variant(Optional))
            actx_word_p.ActiveDocument.Tables.Add(actx_word_p.Selection.Range,nr_rows_p,nr_cols_p,1,1);
            %Hard-coded optionals                     
            %first 1 same as DefaultTableBehavior:=wdWord9TableBehavior
            %last  1 same as AutoFitBehavior:= wdAutoFitContent

            %write the data into the table
            for r=1:nr_rows_p
                for c=1:nr_cols_p
                    %write data into current cell
                    obj.WordText(actx_word_p,data_cell_p{r,c},'Normal',[0,0]);

                    if(r*c==nr_rows_p*nr_cols_p)
                        %we are done, leave the table
                        actx_word_p.Selection.MoveDown;
                    else%move on to next cell 
                        actx_word_p.Selection.MoveRight;
                    end            
                end
            end
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function WordPageNumbers(obj, actx_word_p,align_p)
            %make sure the window isn't split
            if (~strcmp(actx_word_p.ActiveWindow.View.SplitSpecial,'wdPaneNone')) 
                actx_word_p.Panes(2).Close;
            end
            %make sure we are in printview
            if (strcmp(actx_word_p.ActiveWindow.ActivePane.View.Type,'wdNormalView') | ...
                strcmp(actx_word_p.ActiveWindow.ActivePane.View.Type,'wdOutlineView'))
                actx_word_p.ActiveWindow.ActivePane.View.Type ='wdPrintView';
            end
            %view the headers-footers
            actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageHeader';
            if actx_word_p.Selection.HeaderFooter.IsHeader
                actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageFooter';
            else
                actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekCurrentPageHeader';
            end
            %now add the pagenumbers 0->don't display any pagenumber on first page
             actx_word_p.Selection.HeaderFooter.PageNumbers.Add(align_p,0);
             actx_word_p.ActiveWindow.ActivePane.View.SeekView='wdSeekMainDocument';
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function PrintMethods(obj, actx_word_p,category_p)
            style='Heading 3';
            text=strcat(category_p,'-methods');
            obj.WordText(actx_word_p,text,style,[1,1]);           

            style='Normal';    
            text=strcat('Methods called from Matlab as: ActXWord.',category_p,'.MethodName(xxx)');
            obj.WordText(actx_word_p,text,style,[0,0]);           
            text='Ignore the first parameter "handle". ';
            obj.WordText(actx_word_p,text,style,[1,3]);           

            MethodsStruct=eval(['invoke(actx_word_p.' category_p ')']);
            MethodsCell=struct2cell(MethodsStruct);
            NrOfFcns=length(MethodsCell);
            for i=1:NrOfFcns
                MethodString=MethodsCell{i};
                obj.WordText(actx_word_p,MethodString,style,[0,1]);           
            end
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function FigureIntoWord(obj,actx_word_p)
            % Capture current figure/model into clipboard:
            print -dmeta
            % Find end of document and make it the insertion point:
            end_of_doc = get(actx_word_p.activedocument.content,'end');
            set(actx_word_p.application.selection,'Start',end_of_doc);
            set(actx_word_p.application.selection,'End',end_of_doc);
            % Paste the contents of the Clipboard:
            %also works Paste(ActXWord.Selection)
            invoke(actx_word_p.Selection,'Paste');
            actx_word_p.Selection.TypeParagraph; %enter    
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        function CloseWord(obj,actx_word_p,word_handle_p,word_file_p)
            if ~exist(word_file_p,'file')
                % Save file as new:
                invoke(word_handle_p,'SaveAs',word_file_p,1);
            else
                % Save existing file:
                invoke(word_handle_p,'Save');
            end
            % Close the word window:
            invoke(word_handle_p,'Close');            
            % Quit MS Word
            invoke(actx_word_p,'Quit');            
            % Close Word and terminate ActiveX:
            delete(actx_word_p);            
        %return
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end