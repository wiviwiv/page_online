在线课堂-数据库访问接口定义


信息类数据库

用户登陆信息
user_login 
          Uid 用户ID 自增
          User_name 用户名（3~12位中文/英文）
          User_email 用户邮箱（5~20位）唯一
          User_status 用户状态 （整型，3位）
                    200 正常用户
                    201 预注册用户
                    302 未激活（邮箱）用户
                    303 信息未完善用户
                    500 小黑屋用户
          Group_id 用户组id 区分普通用户，课程管理员，区域管理员
          User_activeCode 邮箱激活验证码（32位时间+随机数MD5值）

用户认证信息
user_auth
          Aid 认证表自增id
          Uid 用户uid
          identity_type 认证类型
          1：web
          2:客户端
          3：qq
          4:微信
          5：微博
          6：动态
          Identifier 用户密码
          Last_time 上次登陆时间（时间戳）
          Last_source 上次登陆源


用户组信息
User_group
          Gid 组id
          Group_name 组名
          Group_type 组类型
          0 预注册用户组
          1 普通用户
          2 课程管理员
          3 区域管理员
          4 超级管理员
          Group_status 组状态（用户统一封禁）
                    200 正常组
                    303 只读操作组
                    500 小黑屋组



课程信息
Page_info
          Pid 课程、题库id
          Page_type 课程类型(是否收费\公开)
          0免费公开
          1收费公开
          2免费私密
          3 收费私密
          Page_name 课程，题库名字
          Page_directio 课程描述（字数<255）
          Uid 创建者uid
          Start_time 创建时间（时间戳）
          Page_price (99.99人民币)
          Page_tags 组标签
          Page_status 课程状态
                    200 正常课程
                    201 等待审核课程
                    303 信息未完善用户
                    404 删除的课程
                    500 小黑屋课程
          Page_group_id 课程分类（属于工科，理科，it什么的）


课程现状态
Page_result
          Rid 结果id
          Pid 课程id
          Page_score_all 课程评分9.6（总分）
          Page_score_count 课程评价分数
          Page_view_count 观看次数
          Page_user_count 用户数（收藏为准）


课程组信息
Page_group
          Gid 组id
          Group_name 分类名字
          Group_status 组状态
          200 正常组
          303 只读操作组
          500 小黑屋组
          Group_description 组描述（xxxx是xxxx的，在xxx年xxx，你学习完后,将会xxxx 字数<255）

          课程内容
          Page_content
          Cid 内容id
          Pid 课程id（多个）
          Content_status 内容状态
                    200 正常
                    201草稿（默认）
                    202历史1
                    203历史2 
          content_start 创建时间（时间戳）
          Content_last_end 上次编辑时间（时间戳）


Content_text 内容文本（mediumtext 类型的 JSON）
附表：content_text的JSON结构（本人建议是用Nosql如mongodb操作）

{
          “content_type”:”全国A卷”,
          “content_title”:”数学学院数学补考试卷”,
          “content_info”:{
          “info_title”:”注意事项”,
          “info_body”:[“本试卷分第Ⅰ卷(选择题)和第Ⅱ卷(非选择题)两部分.第Ⅰ卷1至3页，第Ⅱ卷3至5 页”,”答题前，考生务必将自己的姓名、准考证号填写在本试题相应的位置.”,”全部答案在答题卡上完成，答在本试题上无效.”],
          “info_tips”:””
          },
          “sbujects”:{
                    [
                              “sbuject”:{
                              “subject_type”:200,
                              “subject_one_score”:5,
                              “subject_all_score”:50,
                              “subject_count”:10,
                              “subject_title”:”本大题共12小题，每小题5分，在每小题给出的四个选项中，只有一项是符
                              合题目要求的.”,
                              “subjec_info”:{
                                        “info_header”:”已知等差数列na前9项的和为27，10=8a，则100=a”,
                                        “info_option”:[
                                                  “100”,”99”,”98”,”97”
                                        ],
                                        “info_class”:”简单”,
                                        “info_answer”:[
                                                  “100”
                                        ],
                                        “info_reason”:”因为你想得到100分”
                              }

                              }

                    ]
          }

}


订单类信息
Page_order
          Oid 订单id
          Pid 课程id
          Uid 用户id
          Order_num （时间戳+uid+一位随机数）
          Order_status 
                    200 支付成功
                    201 尚未支付
                    300 课程下架
                    301 订单过期
          Order_much 订单金额(99.99)
          Order_description订单描述（参与活动的描述，如打折）
          Order_start 创建时间
          Order_end 支付时间

学习记录类信息
User_ways
          Wid 记录id
          uid用户id
          Pid 课程id
          Way_start 开始时间
          Way_last 结束时间
          Way_bye 做了的题目（999）
          Way_much剩余的题目
          Way_status 路径状态
                    200 未完成
                    201 完成
                    300 题目解散
                    301 题目更改状态
                    404 用户组解散
                    500 无法访问

Study_group 学习组信息
          Sid 组id
          Pid 课程id
          S_title 名称
          S_description 组描述
          Uid 创建者id
          s_start 创建时间
          s_end 结束时间
          s_status 组状态
                    200正常
                    201 等待审核
                    300 未公开
                    500 小黑屋

User_in_study 用户学习组表
          Inid 表id
          Uid 
          Sid 
          U_start
          U_end
          U_status
                    200 正常
                    201 待审核
                    300 预注册
                    500 小黑屋





//本处需要解决问题：
登陆后台逻辑
索引是否合理

//下一次解决问题：
文档存储格式
