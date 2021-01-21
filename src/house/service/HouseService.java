package house.service;

import house.Dao.HouseDao;

public class HouseService {
	HouseDao houseDao = new HouseDao();
	public boolean deleteinfo(String owner) {
		return houseDao.deleteHouse(owner);
	}
	
	public boolean deleteUserRecord(String user) {
		return houseDao.deleteUser(user);
	}
	
	public boolean SetHotSale(String user) {
		return houseDao.setHotSale(user);
	}
	public boolean deleteMessage(String user) {
		return houseDao.deleteMessage(user);
	}
}
