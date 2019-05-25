//
//  DataSet.swift
//  NewNumerology
//
//  Created by Naoki Arakawa on 2019/04/24.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import ChameleonFramework

class DataSet {
  
  //構造体が配列の中に入っている
  //イニシャライズ、初期化、使い始める状態
  let categories = [
    Category(title: "ライフパスナンバー",content: "潜在能力や才能、特技、自分にとって当たり前の考え方を表す。"),
    Category(title: "ディスティニーナンバー", content: " 使命や運命、その人に与えられた役割を表す。"),
    Category(title: "ソウルナンバー", content: "頭では意識していなくても、ついつい望んでしまうこと、行動の原動力を表す。"),
    Category(title: "パーソナルナンバー", content: "表面的な性格、世界観、人に与える印象を表す。")
  ]
  
  
  let lifepass = [
    
    Detail(title : 1,
      label1: "行動力があり、活動的。新しいことや新しい方法で、自分だけの道を切り開くタイプ",
      label2: "決断する、人々を引っ張る、行動が早い、新しい考え方をする、飽き性、サバサバしている、人の上に立ちたい、アイディアを出す、活発、元気",
      imageName: "sunrise",
      color: AppColors.red,
      colorName : "赤"),
    
    Detail(title : 2,
      label1: "控えめで感情豊か、繊細で優しい完成を持つ、目立つのは苦手だが協調性があり、人の話をじっくり聞く力がある",
      label2: "縁の下の力持ち、繋ぐ、仲介する、サポートする、優しさ、柔らかさ、優柔不断、曖昧、決められないが人に従える、平和主義、協力する",
      imageName: "moon",
      color: AppColors.orange,
      colorName : "オレンジ"),
    
    
    Detail(title : 3,
      label1: "活発で楽観的、好奇心旺盛でお喋り好きの明るいタイプ、個性的であることを好み、豊かなイメージをユニークに伝える力がある、クリエイティブ",
      label2: "楽観的、喜ばせ上手、表現力豊か、想像力豊か、計画性がない、物事を深く考えない、自由な発想、優しい心、面倒臭がり",
      imageName: "bell",
      color: AppColors.yellow,
      colorName : "黄"),
    
    Detail(title : 4,
      label1: "真面目で客観的、基礎的なことから積み上げていくマイペースタイプ、論理的な思考で物事を組み立ててい理解する力がある",
      label2: "客観的、冷静、真面目、クールに振舞うが人に優しい、バランス感覚が良い、マイペースであまり出しゃばらない、家族愛のような暖かさ",
      imageName: "tree",
      color: AppColors.green,
      colorName : "緑"),
    
    
    Detail(title : 5,
      label1: "思考力抜群、多彩多芸で変化が好きなタイプ、チャレンジャーな気質を持ち、自分の体験をわかりやすく伝える能力がある",
      label2: "多彩な才能、成長欲が強い、飽き性、子供っぽさ、勇気や行動力がある、楽観的で柔軟、エンターテイメント性がある、深く考えることが好き、フットワークが軽い",
      imageName: "breeze",
      color: AppColors.blue,
      colorName : "青"),
    
 
    
    Detail(title : 6,
      label1: "サービス精神旺盛で、人の喜ぶ顔を見るのが好き、包み込むような優しさと共感力を持ち合わせ、芸術的な感覚も優れている、正義感が強い",
      label2: "人想い、尽くすことや与えることが得意、人の輪が好き、調和を生み出す、頑固、理屈が好き、しっかり者、誰かに優しくしたいと思い行動する",
      imageName: "sea",
      color: AppColors.darkBlue,
      colorName : "濃紺"),
    
    
    Detail(title : 7,
      label1: "独創的で探究心に溢れ、分析と研究が得意である、クールに見えるが、実は寂しがり屋",
      label2: "分析力、洞察力、本質を見極める力、孤高の存在、あまのじゃく、感情に冷静、独特の世界観、あまり人に興味がない、理解されにくい部分がある",
      imageName: "craftsman",
      color: AppColors.purple,
      colorName : "紫"),
    
    Detail(title : 8,
      label1: "強い精神性とバイタリティーを持ち、パワーみなぎる権力者タイプ、責任感と力強さがあり現実的な感覚に優れている",
      label2: "誰かをサポートする力、物欲、成功欲、信じる力、強い精神とプライド、しっかりとした自身、甘え下手、豊かな器",
      imageName: "king",
      color: AppColors.wineRed,
      colorName : "ワインレッド"),
    
    
    Detail(title : 9,
      label1: "理解力に長け、様々な状況に沿って自分を自由自在に演じられるタイプ、柔軟性があり、多彩なセンスと感受性も持ち合わせている",
      label2: "寛大な心、柔軟な考え方、崇高な意識、あまりこだわりはない、理解力、解放する力、八方美人、カリスマ性、理想の世界を見るロマンチストタイプ",
      imageName: "wiseman",
      color: AppColors.gray,
      colorName : "グレー"),
    
  
    
    Detail(title : 11,
      label1: "繊細な感性と、敏感な精神性を持つ。自分だけのロマンチックな世界を持ち、インスピレーション力に優れた感覚派である",
      label2: "直感力、理想が強い、言葉の力が強い、人のことがよくわかる、霊感、ピュアな心、繊細で傷つきやすい、敏感、天然、妄想する力",
      imageName: "stars",
      color: AppColors.silver,
      colorName : "シルバー"),
    
    
   
    
    Detail(title : 22,
      label1: "感性が鋭く周りに強い影響力を持つ、理想の高い夢想家タイプ、先駆けてやることが好きなパイオニア",
      label2: "好奇心が強い、エキセントリックな雰囲気、アイディアが豊富、平凡なことでは満足しない、ジョットコースター的人生",
      imageName: "mountain",
      color: AppColors.gold,
      colorName : "ゴールド"),
    
    
    Detail(title : 33,
      label1: "独自の感覚を持つ宇宙人タイプ、子供のような天真爛漫さと、母のようなしっかりした責任感、相反した性質を持ち合わせる",
      label2: "天真爛漫な性格、愛と喜びを探すのが得意、自分に対する要求が高い、陳腐な愛は嫌い、本質を求める、楽しくてみんなが喜ぶことが好き、優しい",
      imageName: "rainbow",
      color: AppColors.gold,
      colorName : "レインボー")
    

   
  ]
  
  let  destiny = [
    
    Detail(title : 1,
           label1: "新しいものを発見し、自分で道を切り開き、何かを生み出すこと、人とは違う自分だけの道を行くことが使命である、誰かを導き相手に光を与える",
           label2: "切り開く、個として活躍する、新しい発見をする、生み出す、率いる、行動する、独創的なアイディアを見つけ出す、自立する、リーダーシップをとる、自立した人を生み出す",
           imageName: "sunrise",
           color: AppColors.red,
           colorName : "赤"),
    
    Detail(title : 2,
           label1: "人と人、両者が違いや存在を認め合い、どうやったら気持ちよく共存できるのかを知ること、認め合う和を作ることが使命である、表ではなく裏方でサポート",
           label2: "秘書的な存在として相手のサポートをする、裏方で働く、人々をつなげる、みんなの仲介役、平和な空気を生み出す、マンツーマンのサポート",
           imageName: "moon",
           color: AppColors.orange,
           colorName : "オレンジ"),
    
    
    Detail(title : 3,
           label1: "外に向けた発信で感性や言葉の力を使ったメッセージを残すこと、生きる喜びを存在そのもので示していくことが使命である、創造性に満ちた使命を歩む",
           label2: "自己表現で生きる喜びを伝える、想像力や言葉の力を使う、楽しいと思えることで人を巻き込む、瞬間的な思いつきを形にする、会話での表現",
           imageName: "bell",
           color: AppColors.yellow,
           colorName : "黄"),
    
    Detail(title : 4,
           label1: "チームの中を平等に整えて、現実的にまとめたり、組織の基礎を作り上げていくことが使命、企画の現実化をする方法、骨組みの部分を考えることが使命である",
           label2: "想像に欠かせないプロセスを創る、穴を埋める、バランスを生み出す、客観的な視点を与える、普遍的な愛に目覚めさせる、",
           imageName: "tree",
           color: AppColors.green,
           colorName : "緑"),
    
    
    Detail(title : 5,
           label1: "変化の中で、自分の持つ柔軟で臨機応変な発想を、どう生かしていくかを体験し、人々にわかりやすいように伝えていくことが使命である、基本的に成長し続けようとする",
           label2: "人に勇気を与える、成長と冒険を求めて挑戦を繰り返す、好奇心を満たす行動をする、既存のものをアレンジしてより進化した楽しいものにする",
           imageName: "breeze",
           color: AppColors.blue,
           colorName : "青"),
    
    
    
    Detail(title : 6,
           label1: "サポート係や教育係として誠実で責任感のある仕事をすることが使命、無条件に愛することや人を助けることで調和した空間を届けることができる",
           label2: "人を育む、場を教育する、生まれたてのものを育てて自立させる、愛を相手に気づかセル、調和して場を整える、芸術的なセンスを発揮する",
           imageName: "sea",
           color: AppColors.darkBlue,
           colorName : "濃紺"),
    
    
    Detail(title : 7,
           label1: "分析力や研究力を発揮してリサーチすることが使命、自分で発見した神秘や、本質的なことを現実的な形にして伝えていくことを人生をかけて行う",
           label2: "探求し分析した世界観を形にする、自分の持つ感性を形にする、より深く分析し研究を続ける神秘の世界を追い求める、既存の革命、革新",
           imageName: "craftsman",
           color: AppColors.purple,
           colorName : "紫"),
    
    Detail(title : 8,
           label1: "人の隠れた才能を見つけ、豊かな人生の軌道に乗せるためのプロデュースをすることが使命、自分も相手も物質的に豊かになり、精神的にも豊かになり、循環させていくことをしていく",
           label2: "人の良さを引き出す、人や場の可能性を最大限にする、お金や豊かさを生み出す、人と自分の成功を作り上げる、相手の精神的な自立をサポートする",
           imageName: "king",
           color: AppColors.wineRed,
           colorName : "ワインレッド"),
    
    
    Detail(title : 9,
           label1: "柔軟な発想や多彩な芸、臨機応変な対応で相手を理解して、解放していくことで癒しを提供していくことが使命、あらゆる思考から解放されて、無の境地を伝えることができる",
           label2: "感情を解放させる、心をほぐす、理解と許しの提案、物事を完了させる、センスを活かして創造的なことをする、あるがままの表現をする",
           imageName: "wiseman",
           color: AppColors.gray,
           colorName : "グレー"),
    
    
    
    Detail(title : 11,
           label1: "スピリチュアルなメッセージを伝え、人々を啓蒙していくことが使命、直感を信じ、自分の感性を磨くことで、誰かと誰かの架け橋のような存在になる使命を持つ",
           label2: "メッセージを降ろして人に伝える、言葉で人に影響を与えていく、精神的なメッセージを人に届け目覚めさせる、誰かと誰かをつなげる、サブリーダーのポジション",
           imageName: "stars",
           color: AppColors.silver,
           colorName : "シルバー"),
    
    
    
    
    Detail(title : 22,
           label1: "個々が尊重しあい、皆が平等に活躍できる社会やシステム、土台などの形成に携わることが使命、普遍的な愛や安定感のある場を作ることができる",
           label2: "大きな想像のプロセスを担う、物事のバランスを整えて調和をもたらす、乱れをなくし、より現実的なものにする、強い使命感で目的を達成する",
           imageName: "mountain",
           color: AppColors.gold,
           colorName : "ゴールド"),
    
    
    Detail(title : 33,
           label1: "独特の感覚を表現し、相手に無条件の愛を与えることが使命、自分の楽しいと思うことと、人に喜ばれることの両方を同時に実践し、愛と調和の世界を達成していく使命",
           label2: "",
           imageName: "rainbow",
           color: AppColors.blue,
           colorName : "レインボー")
    

   
  ]
  
  let soul = [
    
    Detail(title : 1,
           label1: "一番である、特別である、オンリーワンであるという感覚を味わいたい、最初に始めること、新しい発見をすることを好む",
           label2: "自分に対する強い自信、存在感、人がついてきてくれるという気持ち、みんなが自立していく様を見る、自分のい意志を貫くという体験、生み出すこと、行動すること、目立つこと、一番であると感じている状態",
           imageName: "sunrise",
           color: AppColors.red,
           colorName : "赤"),
    
    Detail(title : 2,
           label1: "調和し、うまく仲介された環境や状況を好む、自分の心をそのまま理解し、その心と仲良くしている状態を好む",
           label2: "調和し、バランスのとれた状態、乱れが整うという感覚、相反するものが融合する体験、素直でいること、平穏な状態、自分と和解、調和している状態、人間関係良好",
           imageName: "moon",
           color: AppColors.orange,
           colorName : "オレンジ"),
    
    
    Detail(title : 3,
           label1: "楽しいこと、自由であることを好む、突破するときのエネルギーが沸き起こった時に喜びを感じる",
           label2: "自由と解放を体験する、常識の破壊と新しい想像にであること、生きているという喜びを体験すること、クリエイティブな自分に目覚めること、楽観的な状態",
           imageName: "bell",
           color: AppColors.yellow,
           colorName : "黄"),
    
    Detail(title : 4,
           label1: "安定感と安心を好む、どんな状況でも平穏な状態で心が冷静でいられること、しっかりとした土台を形成していくことを好む",
           label2: "安定した状態、平穏で冷静である、こつこつ積み上げていく状態、変わらない大切な何かを感じる瞬間、自分のペースを守り自然な状態、きちんと現実的な成果があるという実感",
           imageName: "tree",
           color: AppColors.green,
           colorName : "緑"),
    
    
    Detail(title : 5,
           label1: "好奇心をそそるもの全てに惹かれる、変化を起こし、自分の持つ真実を体験することが一番の喜び",
           label2: "新しい発見と自分の成長を感じること、怖いことへ飛び込むときの勇気を体験、自分の中にある素質を多彩に生かしているという感覚、自由な発想と柔軟な感覚、好奇心を味わえる瞬間、知識を共有する喜び",
           imageName: "breeze",
           color: AppColors.blue,
           colorName : "青"),
    
    
    
    Detail(title : 6,
           label1: "楽しく、心地よく人々との時間を過ごしていたいと願う、愛の状態であること、調和したバランスの良い関係を保つことを望む",
           label2: "場が和み調和している感覚、みんなが嬉しそうに愛に溢れている場を感じる、自分にとっての無条件の愛に目覚める体験、もっと与えたいという衝動、安心感と調和の状態、人の喜ぶ顔を見る瞬間",
           imageName: "sea",
           color: AppColors.darkBlue,
           colorName : "濃紺"),
    
    
    Detail(title : 7,
           label1: "一人の時間を大切にし、じっくりと自分に向き合うことを求める、直感と本質を知るため、一人になれる時間や場所を好む",
           label2: "自分の中に孤立した世界観を感じること、全体の本質がわかる感覚、没頭する感覚、ポリシーを貫く、じっくりと自分に向き合う感覚、独自の世界観を体現すること",
           imageName: "craftsman",
           color: AppColors.purple,
           colorName : "紫"),
    
    Detail(title : 8,
           label1: "自分の才能を使って行動を起こしたとき、効果や成果を生み出すことが目的、精神的、物質的両方の成果を味わえることを好む",
           label2: "自分も周りも精神的、物質的に豊かであると感じられること、現実的な結果が出ている感覚、世の中において影響力があると実感する体験、弱みを克服すること、キャパを超えること",
           imageName: "king",
           color: AppColors.wineRed,
           colorName : "ワインレッド"),
    
    
    Detail(title : 9,
           label1: "無視無欲、ありのままの自分を見つめ、判断をなくした心の眼で全てを見ることを求める、全てである自分、かつなんでもない自分を好む",
           label2: "無我に至る感覚、自我からの解放を体験する、柔軟でかつ壮大な自分の心とつながること、広い視野と柔軟な対応、理解する感覚、根本を見抜く",
           imageName: "wiseman",
           color: AppColors.gray,
           colorName : "グレー"),
    
    
    
    Detail(title : 11,
           label1: "繊細な感性とスピリチュアルなエネルギーを持つ、ピュアな心を守るために人や物や環境を選び、必要なことだけ引き寄せることを好む",
           label2: "自分とつながっている感覚、導きを感じること、偽りのない世界を体験する、無邪気に生きること",
           imageName: "stars",
           color: AppColors.silver,
           colorName : "シルバー"),
    
    
    
    
    Detail(title : 22,
           label1: "世界規模での平穏な安定感、安心感を求める、世界にいる人々が平等であることを望む",
           label2: "壮大な夢を周囲の方達とともに達成するという体験、世界平和級の調和を生み出していると感じられること、争わずに皆が平和であるという体験、人々が平等で幸せである状態",
           imageName: "mountain",
           color: AppColors.gold,
           colorName : "ゴールド"),
    
    
    Detail(title : 33,
           label1: "人の感じないところを感じ、人のキャッチしないことをキャッチすること、喜びと楽しさに溢れた時空を過ごすことを好む",
           label2: "本質的な愛を自分の中に見つけること、生きている喜びに繋がったとき、溢れている愛を伝えたいと感じること、自分の生まれてきた理由を体験すること、人生の喜びを体験すること、人との調和したふれあい、スピリチュアルな感覚",
           imageName: "rainbow",
           color: AppColors.blue,
           colorName : "レインボー")
    
  ]
  
  let personal = [
    
    Detail(title : 1,
           label1: "社交的で行動力、決断力のあるタイプだと見られがち、人々を引っ張っていく吸引力と発信力を持った人物として社会で活躍、ポジティブで悩みがないと思われる",
           label2: "リーダー、先駆者、好戦的、アグレッシブ、ポジティブ、元気、独立独歩、決断力がある",
           imageName: "sunrise",
           color: AppColors.red,
           colorName : "赤"),
    
    Detail(title : 2,
           label1: "柔軟で平和的、平穏な印象、口数が少ない人に思われがち、柔らかな印象で人を癒し、サポートしたりと、フォローする存在として社会で活躍",
           label2: "仲介者、秘書、サポーター、マネージャー、アドバイザー、理解者、穏やか、品がある、受け身",
           imageName: "moon",
           color: AppColors.orange,
           colorName : "オレンジ"),
    
    
    Detail(title : 3,
           label1: "楽しいことが大好きな印象を持たれることが多い、ムードメイカーとして欠かせない人",
           label2: "好奇心旺盛、お茶目、軽快さ、楽観的、アイディアが豊富、流行に敏感、ムードメーカー",
           imageName: "bell",
           color: AppColors.yellow,
           colorName : "黄"),
    
    Detail(title : 4,
           label1: "冷静で控えめ、派手に自分を主張せず安定した存在と思われがち、しっかりとした印象を持たれるので細かい仕事や日々の雑用、管理面でも事務的なことを任させることが多い",
           label2: "真面目、勉強家、平等に優しい、内向的、よきアドバイザー、安定感がある",
           imageName: "tree",
           color: AppColors.green,
           colorName : "緑"),
    
    
    Detail(title : 5,
           label1: "知的で好奇心旺盛な印象を持たれ、理解しにくことをわかりやすく、身近なことに例えて伝えてくれる存在として活躍、体験、成長していることを目的としているとみられる、肩苦しさはない",
           label2: "好奇心旺盛、自由な発想をする、いきなり変化を起こす、思考力が高い、賢い、プレゼン上手",
           imageName: "breeze",
           color: AppColors.blue,
           colorName : "青"),
    
    
    
    Detail(title : 6,
           label1: "おっとりとした印象でありながらもしっかりとした強さも感じさせる、責任感が強く、世話好きで人との接し方や扱い方に長けている、頑固さもあり理屈っぽく見えることがある",
           label2: "人に尽くす、共感性が高い、包容力がある、責任感が強い、頑固、人への接し方や扱いが上手",
           imageName: "sea",
           color: AppColors.darkBlue,
           colorName : "濃紺"),
    
    
    Detail(title : 7,
           label1: "余計なおしゃべりはせず、孤高の雰囲気を感じさせるクールな存在に思われがち、実は心優しい、職人気質で情熱を感じさせ、独創的にみられる",
           label2: "クール、完璧主義、真面目、好き嫌いが激しい、独創的、職人肌、哲学的",
           imageName: "craftsman",
           color: AppColors.purple,
           colorName : "紫"),
    
    Detail(title : 8,
           label1: "控えめでありながらどっしりとしたオーラを感じさせる、見栄っ張りで人に弱みは見せないが、自分でなんとかする姿勢は頼れる大先輩のような雰囲気、冷静沈着で落ち着いた印象を与える",
           label2: "大物オーラ、弱みを見せない、キャリアがある、頼れる存在、プライドが高い、影響力がある、物静か、実行力がある",
           imageName: "king",
           color: AppColors.wineRed,
           colorName : "ワインレッド"),
    
    
    Detail(title : 9,
           label1: "優しい雰囲気を持ちつつ、面白い一面もある、よく掴めない人物だと思われることが多い、相談するにはもってこいのタイプ、いるだけで癒しの存在",
           label2: "理解力がある、よく話を聞いてくれる、視野が広い、考えが柔軟、様々な顔を持つ、ユーモアと姿勢を併せ持つ、寛容、優柔不断",
           imageName: "wiseman",
           color: AppColors.gray,
           colorName : "グレー"),
    
    
    
    Detail(title : 11,
           label1: "クールな完璧さを持ったカリスマ的印象を与える、理想とロマンを持っており、独特の感受性を持ったピュアな人だと思われる",
           label2: "影響力が強い、言葉の力が強い、天然、純粋、ロマンチスト、理想が高い、不思議なオーラ",
           imageName: "stars",
           color: AppColors.silver,
           colorName : "シルバー"),
    
    
    
    
    Detail(title : 22,
           label1: "控えめで、物腰が柔らかい印象、厳しい一面も持ち合わせた正義心溢れる人物にみられる、社会のために役割を果たす",
           label2: "真面目、パワフルな実行力、影響力がある、正義心が強い、控えめで優しさがある",
           imageName: "mountain",
           color: AppColors.gold,
           colorName : "ゴールド"),
    
    
    Detail(title : 33,
           label1: "明るく楽しい雰囲気を醸し出すタイプ、人当たりがよく楽しい存在だと思われる、母のようにしっかりとした一面と子供のような一面を持ち合わせている、不思議なタイプだと思われる",
           label2: "独創的、社交的、思いやりが深い、楽観的、表現が独特、二面性を持つ、感性が豊か",
           imageName: "rainbow",
           color: AppColors.blue,
           colorName : "レインボー")
    
  ]
  

  func getDetails(forCategoryTitle title:String) -> [Detail] {
    switch title {
    case "ライフパスナンバー":
      return lifepass
    case "ディスティニーナンバー":
      return destiny
    case "ソウルナンバー":
      return soul
    case "パーソナルナンバー":
      return personal
    default:
      return lifepass
      
    }
  }
}

