package pagination;

public class Pagination {
	private int page;
	private int totalPage;
	private int offset;
	private int pageSize;

	public Pagination(int page, int totalPage, int offset, int pageSize) {
		this.page = page;
		this.totalPage = totalPage;
		this.offset = offset;
		this.pageSize = pageSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotalPage() {
		int total = this.totalPage / this.pageSize;
		if (this.totalPage % this.pageSize != 0) {
			total += 1;
		}
		return total;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOffset() {
		this.offset = (this.page - 1) * this.pageSize;
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
