package com.korea.sample;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class SampleDTOList {

	private List<SampleDTO> list;

	public SampleDTOList() {
		list = new ArrayList<SampleDTO>();
	}

	public int size() {

		return list.size();
	}

	public SampleDTO get(int i) {

		return list.get(i);
	}

}
