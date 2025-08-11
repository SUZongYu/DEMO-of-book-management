# 图书管理系统

这是一个基于Spring + SpringMVC + MyBatis的图书管理系统，提供了完整的图书CRUD操作功能。

## 系统特性

- ✨ 现代化的响应式UI设计
- 📚 完整的图书管理功能（增删改查）
- 🔍 多条件搜索功能
- 📱 移动端友好的响应式设计
- 🎨 美观的渐变色彩和动画效果

## 技术栈

### 后端
- Spring Framework
- SpringMVC
- MyBatis
- MySQL数据库

### 前端
- HTML5 + CSS3
- 原生JavaScript (ES6+)
- 响应式设计
- 现代化UI组件

## 系统要求

- JDK 8+
- Maven 3.6+
- MySQL 5.7+
- Tomcat 8.5+

## 快速开始

### 1. 数据库配置

1. 确保MySQL服务已启动
2. 执行 `src/main/resources/init.sql` 脚本创建数据库和表
3. 检查 `src/main/resources/jdbc.properties` 中的数据库连接配置

```properties
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/ssm_db?useSSL=false
jdbc.username=root
jdbc.password=123456
```

### 2. 运行项目

#### 方式一：使用Maven插件
```bash
mvn tomcat7:run
```

#### 方式二：部署到Tomcat
1. 执行 `mvn clean package` 打包项目
2. 将生成的WAR文件部署到Tomcat的webapps目录
3. 启动Tomcat

### 3. 访问系统

打开浏览器访问：`http://localhost:8080/bookmanager/`

## 功能说明

### 图书管理
- **添加图书**：填写图书类型、名称和描述信息
- **编辑图书**：点击编辑按钮修改图书信息
- **删除图书**：点击删除按钮移除图书（需确认）
- **查看图书**：系统自动显示所有图书列表

### 搜索功能
- **按类型搜索**：选择特定类型筛选图书
- **按名称搜索**：输入关键词搜索图书名称
- **组合搜索**：同时使用类型和名称条件

### 用户界面
- **响应式设计**：支持桌面端和移动端
- **现代化UI**：使用渐变色彩和阴影效果
- **交互反馈**：操作成功/失败提示信息
- **表单验证**：必填字段验证和用户提示

## 项目结构

```
bookmanager/
├── src/main/java/
│   └── com/itheima/
│       ├── config/          # 配置类
│       ├── controller/      # 控制器
│       ├── service/         # 服务层
│       ├── dao/            # 数据访问层
│       └── domain/         # 实体类
├── src/main/resources/
│   ├── jdbc.properties     # 数据库配置
│   └── init.sql           # 数据库初始化脚本
├── src/main/webapp/
│   ├── index.jsp          # 主页面
│   └── WEB-INF/
│       └── web.xml        # Web配置
└── pom.xml                # Maven配置
```

## API接口

| 方法 | 路径 | 描述 |
|------|------|------|
| GET | `/books` | 获取所有图书 |
| GET | `/books/{id}` | 根据ID获取图书 |
| POST | `/books` | 添加新图书 |
| PUT | `/books` | 更新图书信息 |
| DELETE | `/books/{id}` | 删除指定图书 |

## 注意事项

1. 确保MySQL服务正常运行
2. 检查数据库连接配置是否正确
3. 首次运行需要执行数据库初始化脚本
4. 如果遇到端口冲突，请修改Tomcat配置

## 故障排除

### 常见问题

1. **数据库连接失败**
   - 检查MySQL服务是否启动
   - 验证数据库连接参数
   - 确认数据库用户权限

2. **页面无法访问**
   - 检查Tomcat是否正常启动
   - 验证项目部署路径
   - 查看Tomcat日志

3. **功能异常**
   - 检查浏览器控制台错误信息
   - 查看后端日志输出
   - 确认数据库表结构正确

## 开发说明

### 添加新功能
1. 在对应的层添加业务逻辑
2. 更新前端界面
3. 测试功能完整性

### 修改样式
- 主要样式在 `index.jsp` 的 `<style>` 标签中
- 使用CSS变量便于主题定制
- 支持响应式断点调整

### 扩展搜索
- 当前搜索为客户端过滤
- 可扩展为服务端搜索以提高性能
- 支持分页显示大量数据

## 许可证

本项目仅供学习和演示使用。

## 联系方式

如有问题或建议，请联系开发团队。 
