package com.itheima.ssm.controller;


import com.itheima.ssm.domain.Product;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class LuceneHelper {

    private static String INDEX_PATH = "d:/temp/index";

    /**
     * 向索引库中添加一条数据
     *
     * @param product
     */
    public static void addDocument(Product product) throws IOException {
        //索引库的目录对象
        Directory directory = FSDirectory.open(new File(INDEX_PATH).toPath());
        //使用IK分词器创建索引写入对象
        IndexWriter indexWriter = new IndexWriter(directory, new IndexWriterConfig(new IKAnalyzer()));

        //创建出一个Document对象
        Document document = new Document();

        //将product的信息转换到document中
        document.add(new StringField("productNum", product.getProductNum(), Field.Store.YES));
        document.add(new TextField("productName", product.getProductName(), Field.Store.YES));
        document.add(new TextField("productDesc", product.getProductDesc(), Field.Store.YES));
        indexWriter.addDocument(document);
        indexWriter.close();
    }

    //删库
    public static void deleteIndex() throws IOException {
        //索引库的目录对象
        Directory directory = FSDirectory.open(new File(INDEX_PATH).toPath());
        //使用IK分词器创建索引写入对象
        IndexWriter indexWriter = new IndexWriter(directory, new IndexWriterConfig(new IKAnalyzer()));
        indexWriter.deleteAll();
        indexWriter.close();
    }

    //查询，只要你给一个Query对象即可
    public static List<Product> seacher(Query query) throws IOException {
        Directory directory = FSDirectory.open(new File(INDEX_PATH).toPath());

        IndexReader indexReader = DirectoryReader.open(directory);

        IndexSearcher indexSearcher = new IndexSearcher(indexReader);

        List<Product> list = new ArrayList<>();

        TopDocs topDocs = indexSearcher.search(query, 10);

        for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
            int doc = scoreDoc.doc;//文档的编号
            Document document = indexReader.document(doc);
            //将Document对象转换成Product对象
            Product product = new Product();

            product.setProductNum(document.get("productNum"));
            product.setProductName(document.get("productName"));
            product.setProductDesc(document.get("productDesc"));

            list.add(product);
        }
        return list;
    }
}
