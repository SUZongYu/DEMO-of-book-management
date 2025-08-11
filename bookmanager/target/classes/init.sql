-- 创建数据库
CREATE DATABASE IF NOT EXISTS ssm_db DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE ssm_db;

-- 创建图书表
CREATE TABLE IF NOT EXISTS tbl_book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL COMMENT '图书类型',
    name VARCHAR(200) NOT NULL COMMENT '图书名称',
    description TEXT COMMENT '图书描述',
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='图书信息表';

-- 插入一些示例数据
INSERT INTO tbl_book (type, name, description) VALUES
('文学', '红楼梦', '中国古典四大名著之一，描写贾宝玉和林黛玉的爱情故事'),
('科技', 'Java编程思想', 'Java编程的经典教材，深入浅出地讲解Java编程概念'),
('历史', '史记', '司马迁所著的纪传体通史，记载了上至上古传说中的黄帝时代'),
('艺术', '艺术的故事', '贡布里希所著的艺术史经典，介绍艺术发展的历程'),
('教育', '教育心理学', '探讨学习过程中的心理机制和教育方法'),
('文学', '百年孤独', '加西亚·马尔克斯的魔幻现实主义代表作'),
('科技', '算法导论', '计算机科学领域的经典教材，介绍各种算法'),
('历史', '资治通鉴', '司马光主编的编年体通史，记载了从战国到五代的历史');

-- 创建索引
CREATE INDEX idx_book_type ON tbl_book(type);
CREATE INDEX idx_book_name ON tbl_book(name); 