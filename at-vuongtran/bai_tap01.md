1. So sanh 
> - git commit -m "Message" dung de commit file da add vao.
> - git commit -am "Message" la viet tat cua -a -m dung de add va commit file.

2. Repository
> La thu muc, noi luu tru code, resource. Co 2 loai la repo local- luu tru o may tinh ca nhan, repo server - tren server.

3.Cac buoc de push code
> - `git add file ` .
> - `git commit -m file` .
>- `git push origin branch` .
4. Merge vs Rebase
**Merge**
> khi merge se co them commit merge. lay commit cuoi cung cua 2 nhanh roi combine . khi xay ra conflict code cua ban se o duoi.

**Rebase**
> Khi rebase se khong co them commit. coppy tat ca cac commit cua nhanh feature dat len dau cua nhanh master. khi xay ra conflict code cua ban se o tren.

5. Pull Request
> **Pull request** la sau khi minh push code len repo server thi tao 1 pull request de nguoi quan ly repo review neu sai thi co the comment yeu cau sua sai, neu dung co the merge vao.

6. Tim hieu markdown
- #code la tuong tu nhu the h1 cua html cang nhieu dau `#` thi kich co cang giam dan
- `[code][1]` tao ra tuong tu nhu the a cua html, click vao se dua den duong dan cua `[1]` khai bao o phia duoi
- `>` Tao 1 doan van ban duoc thut vao so voi le 1 khoang
- Co the tao ra 1 table bang cac dau `|` voi dau `:` la can le theo huong nao do
- co the tao ra  checkboxes bang  [] va  [x] 
