# グローバル変数は関数内での読み込みのみが可能
x = 10

def update():
    x += 30 # グローバル変数は関数内での読み込みのみが可能なためエラーとなります
    print(x) 

update()
print(x) 
