package com.csd.nandai.dao;

import com.csd.nandai.domain.Book;
import com.csd.nandai.util.PageUtil;

import java.util.List;

/**
 * Created by Administrator on 2016-05-04.
 */
public interface BookDao {
    int countAll();

    List<Book> findAll(PageUtil page);

    Book findOne(int bookid);
}
