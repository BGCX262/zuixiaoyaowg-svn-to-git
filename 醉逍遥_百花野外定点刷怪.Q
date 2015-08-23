[General]
SyntaxVersion=2
BeginHotkey=121
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=8c8cccf8-683e-4bb9-99c6-4ed153af2f66
Description=我的脚本4
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[UIPackage]
UEsDBBQAAgAIAHIANz9aowS3HAAAAC8AAAAJABEAVUlQYWNrYWdlVVQNAAftzHtO7cx7Tu3Me05jYmBgYIRiFrf8olxWEGHICOIjgXgmBoYfQBoAUEsBAhcLFAACAAgAcgA3P1qjBLccAAAALwAAAAkACQAAAAAAAAAAAACAAAAAAFVJUGFja2FnZVVUBQAH7cx7TlBLBQYAAAAAAQABAEAAAABUAAAAAAA=


[Script]
   Delay 10
 Call 打怪()
//Call 移动鼠标()
   Delay 1000  
    
EndScript
//================== 子程序 ========================
         Sub 获取窗体信息()     
       Delay 1000  
    
          Hwnd = Plugin.Window.MousePoint()
          //获取窗口的信息, GetClientRect 返回的信息是一个字符串, 格式如:123|356|200|400
            s = Plugin.Window.GetClientRect(hwnd)
    Trim(字符串)
            //按|对上面的字符串进行分割, 并保存到数组里面
            //Split进行分割后, MyArray数组中的数组如下:
            // MyArray(0) = 123  <---窗口的左边坐标
            // MyArray(1) = 356  <---窗口的上边坐标
            // MyArray(2) = 200  <---窗口的宽度
            // MyArray(3) = 400  <---窗口的高度
            //注意: 数组的第一个元素, 读取的时候是 MyArray(0), 而不是  MyArray(1)
            //即数组元素的下标是从 0 开始, 而不是从 1 开始的
            dim MyArray
            MyArray = Split(s, "|", -1, 1)
            //用 & 连字符, 将各数组连接起来
//            s = "坐标(x,y)：" & MyArray(0) & "," & MyArray(1) & " 宽度，高度：" & MyArray(2) & "," & MyArray(3)
            //获取窗口的类名称
            s1 = Plugin.Window.GetClass(hwnd)
            //获取窗口的标题
            s2 = Plugin.Window.GetText(hwnd)
            s2 = ",标题：" & s2
            s3 = " 句柄： " & CStr(hwnd)
            //保存上面的各种信息写到弹出窗口
            // MessageBox  s1 & s2 & s & s3
End Sub

         Sub 打怪()
          	  Delay 1000
          	  //获取窗口句柄
              Hwnd = Plugin.Window.MousePoint()
              Delay 100
              // MessageBox hwnd
	          Dim hong, lan
	          //内存获取剩余红蓝数值
              hong=Plugin.Memory.Read32Bit(hwnd,&h1852D5E8)
              lan=Plugin.Memory.Read32Bit(hwnd,&h1852D5EC)
              //MessageBox hong & lan
              //当血条大于2000时使用技能打怪循环。。
              While hong > 2000 and lan>300

             
                  Call 技能1()
                  call 技能2()
                  hong=Plugin.Memory.Read32Bit(hwnd,&h1852D5E8)	
                  lan=Plugin.Memory.Read32Bit(hwnd,&h1852D5EC)
                  Wend
              While hong <1000
                   Call 回血()
                    hong = Plugin.Memory.Read32Bit(hwnd, &h1852D5E8)
                    lan=Plugin.Memory.Read32Bit(hwnd,&h1852D5EC)	
              Wend
              While hong <300
                   Call  吃药回蓝()
                    hong = Plugin.Memory.Read32Bit(hwnd, &h1852D5E8)
                     lan=Plugin.Memory.Read32Bit(hwnd,&h1852D5EC)	
              Wend
            End Sub
           
         Sub 技能1()
	           
	            Delay 1000
                 
                 Call Plugin.Bkgnd.KeyPress(hwnd, 87)
                     Delay 200
               
                 Call Plugin.Bkgnd.KeyPress(hwnd, 49)
                  Delay 200
                  
                 Call Plugin.Bkgnd.KeyPress(hwnd, 49)
                 Delay 200
                   
           End Sub
               
          Sub 回血()
	           
	          Delay 4500
                 
              KeyDown 18, 1
              KeyPress 53, 1
              KeyUp 18, 1
              Delay 200
               
           End Sub
           

 Sub 技能2()
	           
	          Delay 4500
                 
             
              KeyPress 50, 1
              
              Delay 200
               
           End Sub
          Sub  吃药回蓝()
	           
	          Delay 200
                 
             
              KeyPress 54, 1
              
              Delay 200
               
           End Sub
          
          Sub 移动鼠标()
    Delay 1000
    Delay 1000
    Call 获取窗体信息()
     x =MyArray(0)
     y = MyArray(1)
      MessageBox x
        
    CInt(x)
    CInt(y)
    
      
Call Plugin.Bkgnd.MoveTo(Hwnd, x, y)
        x =10+x
            y = 19 + y
            
          MessageBox x
      
        Call Plugin.Bkgnd.MoveTo(Hwnd, x, y)
//    Call Plugin.Bkgnd.KeyDown(Hwnd, 16)
//    Call Plugin.Bkgnd.RightClick(Hwnd, 0, 0)
//    Call Plugin.Bkgnd.KeyUp(Hwnd, 16)
 End Sub