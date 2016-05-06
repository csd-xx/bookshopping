package com.csd.nandai.service;

import com.csd.nandai.domain.Book;
import com.csd.nandai.util.PageUtil;

import java.util.List;

/**
 * Created by Administrator on 2016-05-04.
 */
public interface BookService {
    int countAll();

    List<Book> findAll(PageUtil page);

    Book findOne(int bookid);
}
