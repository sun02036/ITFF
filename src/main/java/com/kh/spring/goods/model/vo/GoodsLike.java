package com.kh.spring.goods.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GoodsLike implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int goodsLikeId;
	private int pId;
	private String userId;
	
}
