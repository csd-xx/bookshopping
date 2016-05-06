package com.csd.nandai.service;

import com.csd.nandai.dao.BookDao;
import com.csd.nandai.domain.Book;
import com.csd.nandai.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016-05-04.
 */
@Service("bookService")
public class BookServiceImpl implements BookService{
    @Resource
    private BookDao bookDao;
    public int countAll() {
        return bookDao.countAll();
    }

        public List<Book> findAll(PageUtil page) {
        return bookDao.findAll(page);
    }

    public Book findOne(int bookid) {
        return bookDao.findOne(bookid);
    }
}
