package dao;

import java.util.List;

public interface IDAO<T, K> {
	/*用泛型定义的接口*/
	public boolean doCreate(T vo) throws Exception;
	public boolean doUpdate(T vo) throws Exception;
	public boolean doRemove(K id) throws Exception;
	public T findById(K id) throws Exception;
	public List<T> findAll(String KeyWord) throws Exception;
	public List<T> findAll(String KeyWord, int currentPage, int lineSize) throws Exception;
	public long getAllCount(String KeyWord) throws Exception;
}
