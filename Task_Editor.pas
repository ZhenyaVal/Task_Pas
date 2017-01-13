program Task_Editor;
uses Crt;
var
//По оки
MaStd,MaNStd:text;//Ма еoа ика-- с д. и нес д.
PhysStd,PhysNStd:text;//Физика -- с д. и нес д.
InfStd,InfNStd:text;// Ин . --- с д и нес д.
CheStd,CheNStd:text;//Хиoи  --- с д. и нес д.
MathAnStd,MathAnNStd:text;//Ма Ан --- с д. и нес д.
LAStd,LANStd:text;//ЛинА└г -- с д и нес д.
SchGeomStd:text;//Геоoе  и
Topol,DifGeom:text;//То╗о└оги  и Ди Геo
AbsAStd,AbsANStd:text;//А└геб а --- С д и нес д.
Str:text;//Help-Cur-File
ListF:text;
//Пе еoенн е
k,i,j: byte;//с    ик о ве ов
is_det: array [1..100] of boolean;//Массив иден и ика ии
ch:char;
nam:string;
a:real;
err:integer;
function Read_Str(var s: string):string;
var
c:char;
begin
s:='';
repeat
c:=readkey;
if (c<>#13) then
 begin
  write(c);
  s:=s+c;
 end
else writeln;
until c=#13;
Read_Str:= s;
end;
function count (var f:text): integer;
var i:integer;
c:char;
begin
 i:=0;
 Reset(f);
 while(not Eof(f)) do
  begin
   read(f,c);
    if (c=' ') then i:=i+1;
  end;
  writeln('I=',i);
 count:=i;
end;
procedure Add_task(var f:text);
var s:string;
t:integer;
begin
 Append(f);
 Write('Please enter text of task:');
 Read_Str(s);
 t:=count(f);
 writeln('Num = ',t);
 write(f,'  ');
 writeln(f,t+1);
 writeln(f,s);
 writeln();
 writeln('If you want skip it please enter <<->>');
 Write('Answer:');
 Read_Str(s);
 if (s<>'-') then
  begin
   writeln(f,'*');
   writeln(f,s);
  end;
 Writeln(f,'***');
end;
procedure show_files();
begin
writeln('Scholar:');
writeln;
writeln('1. Math(N/S).');
writeln('2. Informatics(N/S).');
writeln('3. Physics(N/S).');
writeln('4. Chemistry(N/S).');
writeln('6. Geometry.');
writeln('-----------------------');
writeln;
writeln('University:');
writeln();
writeln('1. Algebra(N/S).');
writeln('2. DiffGeometry.');
writeln('3. Topology.');
writeln('4. Linear_Algebra(N/S).');
writeln('5. Analysis(N/S).');
writeln('-----------------------');
writeln('All --- Mean All Std Files');
end;

//
//
//Program_started!
//
//
begin
ClrScr;
for i:=1 to 100 do is_det[i]:=false;
Assign(ListF,'Files.cfg');
writeln('It is program for edit Task Files (for Task Generator by Eugenue).');
writeln('------------------------------------------');
writeln('What do you want to do?');
writeln;
writeln('1. Check files with tasks (and edit tasks).');
writeln('Alias: i am experience user.');
writeln;
writeln('2. Create new file with tasks.');
writeln('Alias: i am new user.');
writeln;
writeln('---------------------------------');
write('You answer:');
read(k);
writeln;
//Физика
 Assign(PhysStd,'Physics_Std.data');
 Assign(PhysNStd,'Physics_NStd.data');
 //Ин о oа ика
 Assign(InfStd, 'Informatics_Std.data');
 Assign(InfNStd,'Informatics_NStd.data');
 //Ма еoа ика
 Assign(MaStd, 'Triv_Math_Std.data');
 Assign(MaNStd,'Triv_Math_NStd.data');
 //Хиoи
 Assign(CheStd,'Chemistry_Std.data');
 Assign(CheNStd,'Chemistry_NStd.data');
 //Ма Ан
 Assign(MathAnStd,'Analysis_Std.data');
 Assign(MathAnNStd,'Analysis_NStd.data');
 //Лин А└г
 Assign(LAStd,'LinAlg_Std.data');
 Assign(LANStd,'LinAlg_NStd.data');
 //Геоoе  и
 Assign(SchGeomStd,'Geometry.data');
 //То╗о└оги
 Assign(Topol,'Topology.data');
 //Ди  Геo
 Assign(DifGeom,'DifGeom.data');
 //А└геб а
 Assign(AbsAStd,'Algebra_Std.data');
 Assign(AbsANStd,'Algebra_NStd.data');
 //Ма  Ан
 Assign(MathAnStd,'MathAn_Std.data');
 Assign(MathAnNStd,'MathAn_NStd.data');
  if(k=1) then
   begin
    writeln('Please choose (write) the name of file,which you need.');
    writeln('! Or i will check all files! !');
//    Append(ListF);
    writeln;
    writeln('For help/example write <<?>> ');
    writeln('------------------------------');
    write('You answer:');
    Read_Str(nam);
    writeln;
    writeln('Nam=',nam);
    if(nam='?') then
     begin
      show_files();
      writeln('----------------------');
      write('You answer:');
      Read_Str(nam);
       if (nam='MathN') then
        begin
         {$I-} Reset(MaNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Math.');
            write('Sorry. Put files and program near.');
           end
          else
           begin
            writeln('I am load file. Sucsessful!');
            is_det[1]:=true;
           end;
        end;

      if (nam='MathS') then
        begin
         {$I-} Reset(MaStd);{$I+}
         err:=ioresult;
         if(err<>0) then
          begin
           writeln('I can not open file with tasks of Math.');
           write('Sorry. Put files and program near.');
          end
          else
           begin
            writeln('I am load file. Sucsessful!');
            is_det[2]:=true;
           end;
        end;
       if (nam='PhysN') then
        begin
         {$I-} Reset(PhysNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Phys.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[3]:=true;
           end;
        end;
        if (nam='PhysS') then
         begin
          {$I-} Reset(PhysStd);{$I+}
          err:=ioresult;
           if(err<>0) then
            begin
             writeln('I can not open file with tasks of Phys.');
             write('Sorry. Put files and program near.');
            end
            else
             begin
              writeln('I am load file. Sucsessful!');
              is_det[4]:=true;
             end;
         end;
        if (nam='InfN') then
        begin
         {$I-} Reset(InfNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Informatics.');
            write('Sorry. Put files and program near.');
           end
           else
            begin
             writeln('I am load file. Sucsessful!');
             is_det[5]:=true;
            end;
        end;
        if (nam='InfS') then
        begin
         {$I-} Reset(InfStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Informatics.');
            write('Sorry. Put files and program near.');
           end
           else
            begin
             writeln('I am load file. Sucsessful!');
             is_det[6]:=true;
            end;
        end;
        if (nam='CheN') then
        begin
         {$I-} Reset(CheNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Chemistry.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[7]:=true;
           end;
        end;
        if (nam='CheS') then
        begin
         {$I-} Reset(CheStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Chemistry.');
            write('Sorry. Put files and program near.');
           end
           else
            begin
             writeln('I am load file. Sucsessful!');
             is_det[8]:=true;
            end;
        end;
        if (nam='Geometry') then
        begin
         {$I-} Reset(SchGeomStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Geometry.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[9]:=true;
          end;
        end;
        if (nam='AlgebraN') then
        begin
         {$I-} Reset(AbsANStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Algebra.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[10]:=true;
          end;
        end;
        if (nam='AlgebraS') then
        begin
         {$I-} Reset(AbsAStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Algebra.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[11]:=true;
          end;
        end;
        if (nam='DiffGeometry') then
        begin
         {$I-} Reset(DifGeom);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of DG.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[12]:=true;
          end;
          end;
        if (nam='Topology') then
        begin
         {$I-} Reset(Topol);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Topology.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[13]:=true;
          end;
          end;
        if (nam='Linear_AlgebraN') then
        begin
         {$I-} Reset(LANStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Lin Algebra.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[14]:=true;
        end;
        end;
        if (nam='Linear_AlgebraS') then
        begin
         {$I-} Reset(LAStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Lin Algebra.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[15]:=true;
          end;
          end;
        if (nam='AnalysisN') then
        begin
         {$I-} Reset(MathAnNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Analysis.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[16]:=true;
          end;
          end;
        if (nam='AnalysisS') then
        begin
         {$I-} Reset(MathAnStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Analysis.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[17]:=true;
          end;
       end;
        if (nam='All') then
        begin
         {$I-} Reset(MaStd);{$I+}
         err:=ioresult;
         {$I-} Reset(MaNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(MathAnStd);{$I+}
         err:=ioresult;
         {$I-} Reset(MathAnNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(PhysStd);{$I+}
         err:=ioresult;
         {$I-} Reset(PhysNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(InfStd);{$I+}
         err:=ioresult;
         {$I-} Reset(InfNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(CheStd);{$I+}
         err:=ioresult;
         {$I-} Reset(CheNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(LAStd);{$I+}
         err:=ioresult;
         {$I-} Reset(LANStd);{$I+}
         err:=ioresult;
         {$I-} Reset(SchGeomStd);{$I+}
         err:=ioresult;
         {$I-} Reset(Topol);{$I+}
         err:=ioresult;
         {$I-} Reset(DifGeom);{$I+}
         err:=ioresult;
          {$I-} Reset(AbsAStd);{$I+}
         err:=ioresult;
         {$I-} Reset(AbsANStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open files.');
            write('Sorry. Put files and program near.');
           end
           else  begin writeln('I am load all files. Sucsessful!');
           for i:=1 to 17 do is_det[i]:=true;
        end;
    end;
   end
   else
     begin
      if (nam='MathN') then
        begin
         {$I-} Reset(MaNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Math.');
            write('Sorry. Put files and program near.');
           end
          else
           begin
            writeln('I am load file. Sucsessful!');
            is_det[1]:=true;
           end;
        end;
       if (nam='MathS') then
        begin
         {$I-} Reset(MaStd);{$I+}
         err:=ioresult;
         if(err<>0) then
          begin
           writeln('I can not open file with tasks of Math.');
           write('Sorry. Put files and program near.');
          end
          else
           begin
            writeln('I am load file. Sucsessful!');
            is_det[2]:=true;
           end;
        end;
       if (nam='PhysN') then
        begin
         {$I-} Reset(PhysNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Phys.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[3]:=true;
           end;
        end;
        if (nam='PhysS') then
         begin
          {$I-} Reset(PhysStd);{$I+}
          err:=ioresult;
           if(err<>0) then
            begin
             writeln('I can not open file with tasks of Phys.');
             write('Sorry. Put files and program near.');
            end
            else
             begin
              writeln('I am load file. Sucsessful!');
              is_det[4]:=true;
             end;
         end;
        if (nam='InfN') then
        begin
         {$I-} Reset(InfNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Informatics.');
            write('Sorry. Put files and program near.');
           end
           else
            begin
             writeln('I am load file. Sucsessful!');
             is_det[5]:=true;
            end;
        end;
        if (nam='InfS') then
        begin
         {$I-} Reset(InfStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Informatics.');
            write('Sorry. Put files and program near.');
           end
           else
            begin
             writeln('I am load file. Sucsessful!');
             is_det[6]:=true;
            end;
        end;
        if (nam='CheN') then
        begin
         {$I-} Reset(CheNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Chemistry.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[7]:=true;
           end;
        end;
        if (nam='CheS') then
        begin
         {$I-} Reset(CheStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Chemistry.');
            write('Sorry. Put files and program near.');
           end
           else
            begin
             writeln('I am load file. Sucsessful!');
             is_det[8]:=true;
            end;
        end;
        if (nam='Geometry') then
        begin
         {$I-} Reset(SchGeomStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Geometry.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[9]:=true;
          end;
        end;
        if (nam='AlgebraN') then
        begin
         {$I-} Reset(AbsANStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Algebra.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[10]:=true;
          end;
        end;
        if (nam='AlgebraS') then
        begin
         {$I-} Reset(AbsAStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Algebra.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[11]:=true;
          end;
        end;
        if (nam='DiffGeometry') then
        begin
         {$I-} Reset(DifGeom);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of DG.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[12]:=true;
          end;
          end;
        if (nam='Topology') then
        begin
         {$I-} Reset(Topol);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Topology.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[13]:=true;
          end;
          end;
        if (nam='Linear_AlgebraN') then
        begin
         {$I-} Reset(LANStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Lin Algebra.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[14]:=true;
        end;
        end;
        if (nam='Linear_AlgebraS') then
        begin
         {$I-} Reset(LAStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Lin Algebra.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[15]:=true;
          end;
          end;
        if (nam='AnalysisN') then
        begin
         {$I-} Reset(MathAnNStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Analysis.');
            write('Sorry. Put files and program near.');
           end
           else begin
           writeln('I am load file. Sucsessful!');
           is_det[16]:=true;
          end;
          end;
        if (nam='AnalysisS') then
        begin
         {$I-} Reset(MathAnStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open file with tasks of Analysis.');
            write('Sorry. Put files and program near.');
           end
           else
           begin
           writeln('I am load file. Sucsessful!');
           is_det[17]:=true;
          end;
       end;
        if (nam='All') then
        begin
         {$I-} Reset(MaNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(MaStd);{$I+}
         err:=ioresult;
         {$I-} Reset(PhysNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(PhysStd);{$I+}
         err:=ioresult;
         {$I-} Reset(InfNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(InfStd);{$I+}
         err:=ioresult;
         {$I-} Reset(CheNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(CheStd);{$I+}
         err:=ioresult;
         {$I-} Reset(SchGeomStd);{$I+}
         err:=ioresult;
         {$I-} Reset(AbsANStd);{$I+}
         err:=ioresult;
         {$I-} Reset(AbsAStd);{$I+}
         err:=ioresult;
         {$I-} Reset(DifGeom);{$I+}
         err:=ioresult;
         {$I-} Reset(Topol);{$I+}
         err:=ioresult;
         {$I-} Reset(LANStd);{$I+}
         err:=ioresult;
         {$I-} Reset(LAStd);{$I+}
         err:=ioresult;
         {$I-} Reset(MathAnNStd);{$I+}
         err:=ioresult;
         {$I-} Reset(MathAnStd);{$I+}
         err:=ioresult;
          if(err<>0) then
           begin
            writeln('I can not open files.');
            write('Sorry. Put files and program near.');
           end
           else
          begin
           writeln('I am load all files. Sucsessful!');
           for i:=1 to 17 do is_det[i]:=true;
          end;
     end;
    end;
   end
   else
    begin
      writeLn('I can create all std files or not.');
      writeln('What do you want?');
      writeln();
      writeln('---------------------');
      writeln('1. Creat all std files.');
      writeln('2. Crate my new file.');
      writeln('3. Create std file.');
      writeln();
      write('You answer:');
      readln(k);
       if (k=1) then
       begin
         Rewrite(MaStd);
         write(MaStd,#26);
         writeln('MaStd sucsess!');
         delay(2000);
         Rewrite(MaNStd);
         write(MaNStd,#26);
         writeln('MaNStd sucsess!');
         delay(2000);
         Rewrite(PhysStd);
         write(PhysStd,#26);
         writeln('PhysStd sucsess!');
         delay(2000);
         Rewrite(PhysNStd);
         write(PhysNStd,#26);
         writeln('PhysNStd sucsess!');
         delay(2000);
         Rewrite(InfStd);
         write(InfStd,#26);
         writeln('InfStd sucsess!');
         delay(2000);
         Rewrite(InfNStd);
         write(InfNStd,#26);
         writeln('InfNStd sucsess!');
         delay(2000);
         Rewrite(CheStd);
         write(CheStd,#26);
         writeln('CheStd sucsess!');
         delay(2000);
         Rewrite(CheNStd);
         write(CheNStd,#26);
         writeln('CheNStd sucsess!');
         delay(2000);
         Rewrite(MathAnStd);
         write(MathAnStd,#26);
         writeln('MathAnStd sucsess!');
         delay(2000);
         Rewrite(MathAnNStd);
         writeln(MathAnNStd,#26);
         writeln('MathAnNStd sucsess!');
         delay(2000);
         Rewrite(LAStd);
         write(LAStd,#26);
         writeln('LAStd sucsess!');
         delay(2000);
         Rewrite(LANStd);
         write(LANStd,#26);
         writeln('LANStd sucsess!');
         delay(2000);
         Rewrite(SchGeomStd);
         write(SchGeomStd,#26);
         writeln('SchGeomStd sucsess!');
         delay(2000);
         Rewrite(Topol);
         write(Topol,#26);
         writeln('Topol sucsess!');
         delay(2000);
         Rewrite(DifGeom);
         writeln(DifGeom,#26);
         writeln('DifGeom sucsess!');
         delay(2000);
         Rewrite(AbsAStd);
         write(AbsAStd,#26);
         writeln('AbsAStd sucsess!');
         delay(2000);
         Rewrite(AbsANStd);
         write(AbsANStd,#26);
         writeln('AbsANStd sucsess!');
         delay(2000);
//         for i:=1 to 17 do is_det[i]:=true;
        exit;
       end;

      if (k=3) then
       begin
         writeln('Enter name of file:');
         writeln('Enter <<?>> for Help/Example');
         writeln('----------------------------');
         write('You answer:');
         Read_Str(nam);
          if(nam='?') then
           begin
            show_files();
            write('You answer:');
            Read_Str(nam);
           end;
         if (nam='MathN') then
        begin
         Rewrite(MaNStd);
         write(MaNStd,#26);
         writeln('I create Math file. Sucsessful!');
         is_det[1]:=true;
        end;
       if (nam='MathS') then
        begin
         Rewrite(MaStd);
         write(MaStd,#26);
         writeln('I create Math file. Sucsessful!');
         is_det[2]:=true;
        end;
       if (nam='PhysN') then
        begin
         Rewrite(PhysNStd);
         write(PhysNStd,#26);
         writeln('I create Phys file. Sucsessful!');
         is_det[3]:=true;
        end;
        if (nam='PhysS') then
         begin
          Rewrite(PhysStd);
          write(PhysStd,#26);
          writeln('I create Phys file. Sucsessful!');
          is_det[4]:=true;
         end;
        if (nam='InfN') then
        begin
         Rewrite(InfNStd);
         write(InfNStd,#26);
         writeln('I create Inf file. Sucsessful!');
         is_det[5]:=true;
        end;
        if (nam='InfS') then
        begin
         Rewrite(InfStd);
         write(InfStd,#26);
         writeln('I create Inf file. Sucsessful!');
         is_det[6]:=true
        end;
        if (nam='CheN') then
        begin
         Rewrite(CheNStd);
         write(CheNStd,#26);
         writeln('I create Chemistry file. Sucsessful!');
         is_det[7]:=true;
        end;
        if (nam='CheS') then
        begin
         Rewrite(CheStd);
         write(CheStd,#26);
         writeln('I create Chemistry file. Sucsessful!');
         is_det[8]:=true;
        end;
        if (nam='Geometry') then
        begin
         Rewrite(SchGeomStd);
         write(SchGeomStd,#26);
         writeln('I create Geometry file. Sucsessful!');
         is_det[9]:=true;
        end;
        if (nam='AlgebraN') then
        begin
         Rewrite(AbsANStd);
         write(AbsANStd,#26);
         writeln('I create Algebra file. Sucsessful!');
         is_det[10]:=true;
        end;
        if (nam='AlgebraS') then
        begin
         Rewrite(AbsAStd);
         write(AbsAStd,#26);
         writeln('I create Algebra file. Sucsessful!');
         is_det[11]:=true;
        end;
        if (nam='DiffGeometry') then
        begin
         Rewrite(DifGeom);
         write(DifGeom,#26);
         writeln('I create DiffGeom file. Sucsessful!');
         is_det[12]:=true;
        end;
        if (nam='Topology') then
        begin
         Rewrite(Topol);
         write(Topol,#26);
         writeln('I create Topology file. Sucsessful!');
         is_det[13]:=true;
        end;
        if (nam='Linear_AlgebraN') then
        begin
         Rewrite(LANStd);
         write(LANStd,#26);
         writeln('I create Lin Alg file. Sucsessful!');
         is_det[14]:=true;
        end;
        if (nam='Linear_AlgebraS') then
        begin
         Rewrite(LAStd);
         write(LAStd,#26);
         writeln('I create Lin Alg file. Sucsessful!');
         is_det[15]:=true;
        end;
        if (nam='AnalysisN') then
        begin
         Rewrite(MathAnNStd);
         write(MathAnNStd,#26);
         writeln('I create Analysis file. Sucsessful!');
         is_det[16]:=true;
        end;
        if (nam='AnalysisS') then
        begin
         Rewrite(MathAnStd);
         write(MathAnStd,#26);
         writeln('I create Analysis file. Sucsessful!');
         is_det[17]:=true;
        end;
        end;
        if (k=2) then
        begin
         Writeln('What the subject of tasks?');
         writeln('Example: Math');
         writeln('Subject is a name of file.');
         writeln('----------------------------');
         write('Name:');
         readln(nam);
         write(ListF,nam);
         nam:=concat(nam,'.data');
         assign(Str,'File.data');
         rewrite(Str);
         close(Str);
         rename(Str,nam);
        end;
    end;
 writeln;
 Close(MaStd);
 Close(MaNStd);
 Close(PhysStd);
 Close(PhysNStd);
 Close(InfStd);
 Close(InfNStd);
 Close(CheStd);
 Close(CheNStd);
 Close(MathAnStd);
 Close(LAStd);
 Close(LANStd);
 Close(SchGeomStd);
 Close(Topol);
 Close(DifGeom);
 Close(AbsAStd);
 Close(AbsANStd);
 Close(ListF);
end.
