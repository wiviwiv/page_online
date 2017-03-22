          在线课堂-数据库访问接口定义

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
          User_activeCode 邮箱激活验证码（32位时间+随机数MD5值）

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

          //本处需要解决问题：
          登陆后台逻辑
          索引是否合理

          //下一次解决问题：
          文档存储格式

