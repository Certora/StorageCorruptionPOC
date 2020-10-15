contract CorruptedState {
	struct Container {
		uint bigValue;
	}
	bytes bytesField;
	function corruptStorage() public returns (uint256) {
		bytes memory d = new bytes(0);
		Container memory f;
		f.bigValue = type(uint).max;
		bytesField = d;
		return f.bigValue;
	}

	function surprising() public returns (bytes1) {
		bytesField.push();
		return bytesField[0];
	}

	/*
	  NOTE: Included only to show low-level representation in storage, inline
	  assembly is NOT necessary to trigger the bug.
	*/
	function getRawSlot() public view returns (uint256 ret) {
		assembly {
		ret := sload(0)
		}
	}
}
