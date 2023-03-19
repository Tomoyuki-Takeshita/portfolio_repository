### **インフラ構築の自動化と秘匿情報の暗号化**
- AWS CloudFormationとTerraformを使用しインフラの構築の自動化と秘匿情報の暗号化を実現しました。
 - 構成はVPC、EC2、RDSになります。
 - RDSはユーザー名とパスワードが記載されているので、そこはSecrets Managerを活用し情報の秘匿化を行いました。
 - AWS Systems Managerのセッションマネージャーを使用して、SSH接続します。
 - AWS CloudFormationはYAML形式でクロススタック、Terraformはリソースごとに細かくファイルを分離して作成しました。

### **インフラ構成図**
![Untitled](https://user-images.githubusercontent.com/63375718/134763155-308a51a0-3896-40fe-bd18-af73e09da6e3.png)


### **ソースコード**
- AWS CloudFormation(ソースコードは[こちら](https://github.com/Tomoyuki-Takeshita/portfolio_repository/tree/master/CloudFormation))
- Terraform(ソースコードは[こちら](https://github.com/Tomoyuki-Takeshita/portfolio_repository/tree/master/TerraForm))

---
