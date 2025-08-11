<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }

        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        }

        .header p {
            font-size: 1.2em;
            opacity: 0.9;
        }

        .content {
            padding: 30px;
        }

        .form-section {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            border: 1px solid #e9ecef;
        }

        .form-section h3 {
            color: #495057;
            margin-bottom: 20px;
            font-size: 1.3em;
        }

        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 15px;
            flex-wrap: wrap;
        }

        .form-group {
            flex: 1;
            min-width: 200px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #495057;
            font-weight: 600;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e9ecef;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus, .form-group select:focus, .form-group textarea:focus {
            outline: none;
            border-color: #4facfe;
            box-shadow: 0 0 0 3px rgba(79, 172, 254, 0.1);
        }

        .btn-group {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(79, 172, 254, 0.3);
        }

        .btn-success {
            background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            color: white;
        }

        .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(67, 233, 123, 0.3);
        }

        .btn-warning {
            background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            color: white;
        }

        .btn-warning:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(250, 112, 154, 0.3);
        }

        .btn-danger {
            background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 100%);
            color: white;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(255, 154, 158, 0.3);
        }

        .btn-secondary {
            background: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background: #5a6268;
            transform: translateY(-2px);
        }

        .table-section {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }

        .table-section h3 {
            background: #f8f9fa;
            padding: 20px;
            margin: 0;
            color: #495057;
            border-bottom: 1px solid #e9ecef;
        }

        .table-container {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
        }

        th {
            background: #f8f9fa;
            font-weight: 600;
            color: #495057;
        }

        tr:hover {
            background: #f8f9fa;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn-sm {
            padding: 8px 15px;
            font-size: 12px;
        }

        .search-section {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
            align-items: end;
        }

        .search-group {
            flex: 1;
            min-width: 200px;
        }

        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid transparent;
        }

        .alert-success {
            background: #d4edda;
            border-color: #c3e6cb;
            color: #155724;
        }

        .alert-danger {
            background: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
        }

        .alert-info {
            background: #d1ecf1;
            border-color: #bee5eb;
            color: #0c5460;
        }

        .hidden {
            display: none;
        }

        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
            }
            
            .btn-group {
                justify-content: center;
            }
            
            .search-section {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📚 图书管理系统</h1>
            <p>高效管理您的图书资源</p>
        </div>

        <div class="content">
            <!-- 操作提示 -->
            <div id="alertContainer"></div>

            <!-- 图书信息表单 -->
            <div class="form-section">
                <h3>📝 图书信息</h3>
                <form id="bookForm">
                    <input type="hidden" id="bookId" name="id">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="bookType">图书类型 *</label>
                            <select id="bookType" name="type" required>
                                <option value="">请选择类型</option>
                                <option value="文学">文学</option>
                                <option value="科技">科技</option>
                                <option value="历史">历史</option>
                                <option value="艺术">艺术</option>
                                <option value="教育">教育</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="bookName">图书名称 *</label>
                            <input type="text" id="bookName" name="name" placeholder="请输入图书名称" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label for="bookDescription">图书描述</label>
                            <textarea id="bookDescription" name="description" rows="3" placeholder="请输入图书描述"></textarea>
                        </div>
                    </div>
                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary" id="submitBtn">
                            <span id="submitText">添加图书</span>
                        </button>
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">重置</button>
                        <button type="button" class="btn btn-warning" onclick="cancelEdit()" id="cancelBtn" style="display: none;">取消编辑</button>
                    </div>
                </form>
            </div>

            <!-- 搜索功能 -->
            <div class="form-section">
                <h3>🔍 搜索图书</h3>
                <div class="search-section">
                    <div class="search-group">
                        <label for="searchType">按类型搜索</label>
                        <select id="searchType">
                            <option value="">全部类型</option>
                            <option value="文学">文学</option>
                            <option value="科技">科技</option>
                            <option value="历史">历史</option>
                            <option value="艺术">艺术</option>
                            <option value="教育">教育</option>
                            <option value="其他">其他</option>
                        </select>
                    </div>
                    <div class="search-group">
                        <label for="searchName">按名称搜索</label>
                        <input type="text" id="searchName" placeholder="输入图书名称关键词">
                    </div>
                    <div class="search-group">
                        <button type="button" class="btn btn-success" onclick="searchBooks()">搜索</button>
                        <button type="button" class="btn btn-secondary" onclick="loadAllBooks()">显示全部</button>
                    </div>
                </div>
            </div>

            <!-- 图书列表 -->
            <div class="table-section">
                <h3>📚 图书列表</h3>
                <div class="table-container">
                    <table id="bookTable">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>类型</th>
                                <th>名称</th>
                                <th>描述</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="bookTableBody">
                            <!-- 图书数据将在这里动态显示 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 全局变量
        let isEditing = false;
        let currentBookId = null;

        // 页面加载完成后执行
        document.addEventListener('DOMContentLoaded', function() {
            loadAllBooks();
            setupFormSubmit();
        });

        // 设置表单提交事件
        function setupFormSubmit() {
            document.getElementById('bookForm').addEventListener('submit', function(e) {
                e.preventDefault();
                if (isEditing) {
                    updateBook();
                } else {
                    addBook();
                }
            });
        }

        // 显示提示信息
        function showAlert(message, type = 'info') {
            const alertContainer = document.getElementById('alertContainer');
            const alertDiv = document.createElement('div');
            alertDiv.className = `alert alert-${type}`;
            alertDiv.textContent = message;
            
            alertContainer.innerHTML = '';
            alertContainer.appendChild(alertDiv);
            
            // 3秒后自动消失
            setTimeout(() => {
                alertDiv.remove();
            }, 3000);
        }

        // 重置表单
        function resetForm() {
            document.getElementById('bookForm').reset();
            document.getElementById('bookId').value = '';
            isEditing = false;
            currentBookId = null;
            document.getElementById('submitText').textContent = '添加图书';
            document.getElementById('cancelBtn').style.display = 'none';
        }

        // 取消编辑
        function cancelEdit() {
            resetForm();
        }

        // 添加图书
        async function addBook() {
            const formData = new FormData(document.getElementById('bookForm'));
            const bookData = {
                type: formData.get('type'),
                name: formData.get('name'),
                description: formData.get('description')
            };

            try {
                const response = await fetch('/books', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(bookData)
                });

                if (response.ok) {
                    showAlert('图书添加成功！', 'success');
                    resetForm();
                    loadAllBooks();
                } else {
                    showAlert('添加失败，请重试', 'danger');
                }
            } catch (error) {
                console.error('Error:', error);
                showAlert('网络错误，请检查连接', 'danger');
            }
        }

        // 更新图书
        async function updateBook() {
            const formData = new FormData(document.getElementById('bookForm'));
            const bookData = {
                id: parseInt(formData.get('id')),
                type: formData.get('type'),
                name: formData.get('name'),
                description: formData.get('description')
            };

            try {
                const response = await fetch('/books', {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(bookData)
                });

                if (response.ok) {
                    showAlert('图书更新成功！', 'success');
                    resetForm();
                    loadAllBooks();
                } else {
                    showAlert('更新失败，请重试', 'danger');
                }
            } catch (error) {
                console.error('Error:', error);
                showAlert('网络错误，请检查连接', 'danger');
            }
        }

        // 删除图书
        async function deleteBook(id) {
            if (!confirm('确定要删除这本图书吗？')) {
                return;
            }

            try {
                const response = await fetch(`/books/${id}`, {
                    method: 'DELETE'
                });

                if (response.ok) {
                    showAlert('图书删除成功！', 'success');
                    loadAllBooks();
                } else {
                    showAlert('删除失败，请重试', 'danger');
                }
            } catch (error) {
                console.error('Error:', error);
                showAlert('网络错误，请检查连接', 'danger');
            }
        }

        // 编辑图书
        function editBook(id) {
            // 获取图书信息并填充表单
            fetch(`/books/${id}`)
                .then(response => response.json())
                .then(book => {
                    document.getElementById('bookId').value = book.id;
                    document.getElementById('bookType').value = book.type;
                    document.getElementById('bookName').value = book.name;
                    document.getElementById('bookDescription').value = book.description;
                    
                    isEditing = true;
                    currentBookId = book.id;
                    document.getElementById('submitText').textContent = '更新图书';
                    document.getElementById('cancelBtn').style.display = 'inline-block';
                })
                .catch(error => {
                    console.error('Error:', error);
                    showAlert('获取图书信息失败', 'danger');
                });
        }

        // 加载所有图书
        async function loadAllBooks() {
            try {
                const response = await fetch('/books');
                const books = await response.json();
                displayBooks(books);
            } catch (error) {
                console.error('Error:', error);
                showAlert('加载图书列表失败', 'danger');
            }
        }

        // 搜索图书
        async function searchBooks() {
            const searchType = document.getElementById('searchType').value;
            const searchName = document.getElementById('searchName').value.trim();

            try {
                const response = await fetch('/books');
                let books = await response.json();

                // 客户端过滤
                if (searchType) {
                    books = books.filter(book => book.type === searchType);
                }
                if (searchName) {
                    books = books.filter(book => 
                        book.name.toLowerCase().includes(searchName.toLowerCase())
                    );
                }

                displayBooks(books);
                
                if (books.length === 0) {
                    showAlert('没有找到匹配的图书', 'info');
                }
            } catch (error) {
                console.error('Error:', error);
                showAlert('搜索失败', 'danger');
            }
        }

        // 显示图书列表
        function displayBooks(books) {
            const tbody = document.getElementById('bookTableBody');
            tbody.innerHTML = '';

            if (books.length === 0) {
                tbody.innerHTML = '<tr><td colspan="5" style="text-align: center; padding: 20px; color: #6c757d;">暂无图书数据</td></tr>';
                return;
            }

            books.forEach(book => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${book.id}</td>
                    <td><span class="badge" style="background: #4facfe; color: white; padding: 4px 8px; border-radius: 4px;">${book.type}</span></td>
                    <td><strong>${book.name}</strong></td>
                    <td>${book.description || '-'}</td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-warning btn-sm" onclick="editBook(${book.id})">编辑</button>
                            <button class="btn btn-danger btn-sm" onclick="deleteBook(${book.id})">删除</button>
                        </div>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }

        // 初始化页面
        function initPage() {
            loadAllBooks();
        }

        // 页面加载完成后初始化
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', initPage);
        } else {
            initPage();
        }
    </script>
</body>
</html>
