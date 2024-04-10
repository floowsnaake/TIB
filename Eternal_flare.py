from turtle import right
import pyMeow,customtkinter
from setuptools import Command

process = pyMeow.open_process("torchlight_infinite.exe")

global Read_pc

pc = 0x242992BD193 # string of all the combined coordinates yxz 44 long
py = 0x242992BD193 # y 11 long
px = 0x242992BD19F # x 11 long
pz = 0x242992BD1AB # z 11 long

customtkinter.set_appearance_mode("dark")  # Modes: system (default), light, dark
customtkinter.set_default_color_theme("dark-blue")  # Themes: blue (default), dark-blue, green

app = customtkinter.CTk()
app.title("Eternal flare") 
app.geometry("500x500")
    

tabview = customtkinter.CTkTabview(master=app,width=500,height=500,text_color="Orange")
tabview.pack(padx=0, pady=0)

tabview.add("Main")
tabview.add("Path Maker")
tabview.add("Paths")
tabview.add("Config")
tabview.set("Main")  # set currently visible tab

def button_event():
	if check_var.get() == "on":
		 Read_pc = pyMeow.r_string(process,pc,44)
		 print(Read_pc)
		 app.after(2000, button_event)

def Read_mem():

    Read_py = pyMeow.r_string(process,py,11)
    labely.configure(text="Y " + Read_py)
  
    Read_px = pyMeow.r_string(process,px,11)
    labelx.configure(text="X " + Read_px)
    
    Read_pz = pyMeow.r_string(process,pz,"11")
    labelz.configure(text="Z " + Read_pz)
     
    app.after(10, Read_mem)
    		 
check_var = customtkinter.StringVar(value="off")

label2 = customtkinter.CTkLabel(master=tabview.tab("Main"),width=150,font=('roboto', 22, 'bold'),text="Not liked by Bluedragonrulz",text_color='Red')
label2.pack(pady=1,padx=0)

label = customtkinter.CTkLabel(master=tabview.tab("Path Maker"),width=150,font=('roboto', 33, 'bold'),text="Player Coordinates")
label.pack(pady=1,padx=0)

labely = customtkinter.CTkLabel(master=tabview.tab("Path Maker"),width=150,font=('roboto', 22, 'bold'),text="",text_color='Blue')
labely.pack(pady=1,padx=0)

labelx = customtkinter.CTkLabel(master=tabview.tab("Path Maker"),width=150,font=('roboto', 22, 'bold'),text="",text_color='Red')
labelx.pack(pady=1,padx=0)

labelz = customtkinter.CTkLabel(master=tabview.tab("Path Maker"),width=150,font=('roboto', 22, 'bold'),text="",text_color='yellow')
labelz.pack(pady=1,padx=0)

box = customtkinter.CTkCheckBox(master=tabview.tab("Path Maker"),width=120,font=('roboto', 22, 'bold'),text="Autosave 2 Sec",variable=check_var, onvalue="on", offvalue="off")
box.pack(pady=0,padx=0)

save = customtkinter.CTkButton(master=tabview.tab("Path Maker"),width=120,font=('roboto', 22, 'bold'),text="Save",command=button_event)
save.pack(pady=0,padx=0)

Read_mem()
app.mainloop()
