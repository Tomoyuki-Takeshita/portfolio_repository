## **自己紹介**
初めまして！ 

現在ネットワーク系のインフラエンジニアとして地方の企業で働いています。

AWSの実務経験はありませんが、Azureの構築経験(1年未満)があり、今後はクラウドサービス(特にAWS)を使用した業務を中心に従事したいと思い転職活動をしています。

「AWSが得意なエンジニアです！」と名乗れるように、日々学習しています！

---

## **目次**
| 項目 | 説明 |
| :--- | :--- |
| [プロフィール](https://github.com/Tomoyuki-Takeshita/portfolio_repository#%E3%83%97%E3%83%AD%E3%83%95%E3%82%A3%E3%83%BC%E3%83%AB) | 簡単ですが、プロフィールになります。 |
| [職務履歴書](https://github.com/Tomoyuki-Takeshita/portfolio_repository#%E8%81%B7%E5%8B%99%E5%B1%A5%E6%AD%B4%E6%9B%B8) | 職務履歴書になります。 |
| [学習内容](https://github.com/Tomoyuki-Takeshita/portfolio_repository/blob/master/README.md#%E5%AD%A6%E7%BF%92%E5%86%85%E5%AE%B9) | AWSの学習内容になります。 |
| [取得資格](https://github.com/Tomoyuki-Takeshita/portfolio_repository/blob/master/README.md#%E5%8F%96%E5%BE%97%E8%B3%87%E6%A0%BC) | 資格試験の取得状況です。現在はAWS SAP取得目指して勉強中です。 |
| [制作物](https://github.com/Tomoyuki-Takeshita/portfolio_repository/blob/master/README.md#%E5%88%B6%E4%BD%9C%E7%89%A9) | AWS CloudFormationとTerraformの紹介になります。 |

---
## **プロフィール**
竹下　智之  Tomoyuki　Takeshita

1988年7月6日生まれ：33歳

静岡県浜松市出身、山梨県甲府市在住

浜松市(29年)→東京都(半年)→甲府市(3年3か月)

製造業(6年)、ネットワークエンジニア(3年3か月)


## **職務履歴書**
### **職務要約**
2007年4月～2008年9月 遠州紙工業株式会社(正社員)

2012年6月～2017年6月 日本形染株式会社(正社員)

2018年7月～2019年9月 株式会社テクノプロ テクノプロ・エンジニアリング(正社員)

2019年10月〜2022年3月 株式会社エーティエルシステムズ(個人契約)

### **以下詳細**
職務履歴書は[こちら](https://github.com/Tomoyuki-Takeshita/portfolio_repository/blob/master/%E8%81%B7%E5%8B%99%E7%B5%8C%E6%AD%B4%E6%9B%B8.pdf)

## **学習内容**
・某AWSのオンラインスクールで学習しました。内容は以下になります。
-Ruby on Railsの開発環境構築
-簡単なRuby on Railsアプリの開発
-ネットワーク関連リソース作成、EC2、RDS、ELB、S3の環境を構築
-CloudFormationを使用したAWS環境のコード化 (YAML) 
-環境設定をコード化するためにAnsibleを使用

・その他学習した内容
-Terraformを使用したAWS環境のコード化
-AWSで独自ドメインのhttpsな静的Webサイト(簡単な)を構築(ACM+S3＋CloudFront+Route53）

・資格勉強
AWS ソリューションアーキテクト – アソシエイト 取得
AWS ソリューションアーキテクト プロフェッショナル 勉強中

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
