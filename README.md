## **初めに**
初めまして！ 

現在ネットワーク系のインフラエンジニアとして地方の企業で働いています。

AWSの実務経験はありませんが、Azureの構築経験(1年未満)があり、今後はクラウドサービス(特にAWS)を使用した業務を中心に従事したいと思い転職活動をしています。

「AWSが得意なエンジニアです！」と名乗れるように、日々学習しています！

---

## **目次**
| 項目 | 説明 |
| :--- | :--- |
| [プロフィール](https://github.com/Tomoyuki-Takeshita/Portfolio#プロフィール) | 簡単ですが、プロフィールになります。 |
| [職務履歴書](https://github.com/Tomoyuki-Takeshita/Portfolio#職務履歴書) | 職務履歴書になります。 |
| [取得資格](https://github.com/Tomoyuki-Takeshita/Portfolio#取得資格) | 資格試験の取得状況です。現在はAWS SAP取得目指して勉強中です。 |
| [制作物](https://github.com/Tomoyuki-Takeshita/Portfolio#制作物) | AWS CloudFormationとTerraformの紹介になります。 |

---
## **プロフィール**
竹下　智之  Tomoyuki　Takeshita

1988年7月6日生まれ：33歳

静岡県浜松市出身、山梨県甲府市在住

浜松市(29年)→東京都(半年)→甲府市(3年)

製造業(6年)、ネットワークエンジニア(3年)


## **職務履歴書**
### **職務要約**
2007年4月～2008年9月 遠州紙工業株式会社に入社 製造部に配属

2012年6月～2017年6月 日本形染株式会社に入社 製造部に配属

2018年7月～2019年9月 株式会社テクノプロ テクノプロ・エンジニアリングに入社

2019年10月〜2022年3月 株式会社エーティエルシステムズと個人契約を締結

### **以下詳細**
職務履歴書は[こちら](https://github.com/Tomoyuki-Takeshita/portfolio_repository/tree/master/職務履歴書)

## **取得資格**
| 資格名 | 取得年月 |
| :---- | :-------- |
| [AZ-900: Microsoft Azure Fundamentals](https://www.credly.com/badges/c2f2e34b-4df7-4c0c-b369-ecac1e0d564c/public_url) | 2019/10 |
| [AWS 認定 ソリューションアーキテクト – アソシエイト](https://www.credly.com/badges/14f2c3ec-e380-4231-8ef2-029628260f28/public_url) | 2021/06 |

![microsoft-certified-azure-fundamentals](https://user-images.githubusercontent.com/63375718/123534599-3ff4c880-d759-11eb-835f-7a17664e80db.png)![aws-certified-solutions-architect-associate](https://user-images.githubusercontent.com/63375718/123534604-43884f80-d759-11eb-9592-059c954d5413.png)

---

## **制作物**
### **インフラ構築の自動化と秘匿情報の暗号化**
- AWS CloudFormationとTerraformを使用しインフラの構築の自動化と秘匿情報の暗号化を実現しました。
 - 構成はVPC、EC2、RDSになります。
 - RDSはユーザー名とパスワードが記載されているので、そこはSecrets Managerを活用し情報の秘匿化を行いました。
 - AWS Systems Managerのセッションマネージャーを使用して、SSH接続します。
 - AWS CloudFormationはYAML形式でクロススタック、Terraformはリソースごとに細かくファイルを分離して作成しました。

### **インフラ構成図**
![Untitled](https://user-images.githubusercontent.com/63375718/134763155-308a51a0-3896-40fe-bd18-af73e09da6e3.png)


### **ソースコード**
- AWS CloudFormation(ソースコードは[こちら](https://github.com/Tomoyuki-Takeshita/portfolio_repository/tree/master/cloudformation))
- Terraform(ソースコードは[こちら](https://github.com/Tomoyuki-Takeshita/portfolio_repository/tree/master/terraform))

---
