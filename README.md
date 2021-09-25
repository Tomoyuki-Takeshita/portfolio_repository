## **概要**
初めまして！ 

現在ネットワーク系のインフラエンジニアとして地方の企業で働いています。

今後クラウドサービス(特にAWS)を使用した業務を中心に従事したいと思っています。

「AWSが得意なエンジニアです！」と名乗れるように、日々学習した内容と結果を記載していきます。

---

## **目次**
| 項目 | 説明 |
| :--- | :--- |
| [取得資格](https://github.com/Tomoyuki-Takeshita/Portfolio#取得資格) | 資格試験の取得状況です。AWSが中心となります。 |
| [制作物](https://github.com/Tomoyuki-Takeshita/Portfolio#制作物) | AWS CloudFormationとTerraformの紹介になります。 |

---

## **取得資格**
| 資格名 | 取得年月 |
| :---- | :-------- |
| [AZ-900: Microsoft Azure Fundamentals](https://www.credly.com/badges/c2f2e34b-4df7-4c0c-b369-ecac1e0d564c/public_url) | 2019/10 |
| [AWS 認定 ソリューションアーキテクト – アソシエイト](https://www.credly.com/badges/14f2c3ec-e380-4231-8ef2-029628260f28/public_url) | 2021/06 |

![microsoft-certified-azure-fundamentals](https://user-images.githubusercontent.com/63375718/123534599-3ff4c880-d759-11eb-835f-7a17664e80db.png)![aws-certified-solutions-architect-associate](https://user-images.githubusercontent.com/63375718/123534604-43884f80-d759-11eb-9592-059c954d5413.png)

---

## **制作物**
### **インフラ構築の自動化と秘匿情報の暗号化**
AWS CloudFormationとTerraformを使用しインフラの構築の自動化と秘匿情報の暗号化を実現しました。

構成はVPC、EC2、RDSになります。

RDSはユーザー名とパスワードが記載されているので、そこはSecrets Managerを活用し情報の秘匿化を行いました。

AWS CloudFormationはYAML形式でクロススタック、Terraformはリソースごとに細かくファイルを分離して作成しました。

### **インフラ構成図**
![Untitled](https://user-images.githubusercontent.com/63375718/134763155-308a51a0-3896-40fe-bd18-af73e09da6e3.png)


### **ソースコード**
- AWS CloudFormation(ソースコードは[こちら](https://github.com/Tomoyuki-Takeshita/Portfolio/tree/master/cloudformation))
- Terraform(ソースコードは[こちら](https://github.com/Tomoyuki-Takeshita/Portfolio/tree/master/terraform))

---
