<?php
class ControllerExtensionModuleCategoryblogs extends Controller {
	public function index() {
		$this->load->language('extension/module/category');

		if (isset($this->request->get['category_id'])) {
			$category_id = explode('_', (string)$this->request->get['category_id']);
		} else {
			$category_id = array();
		}

		if (isset($category_id[0])) {
			$data['category_id'] = $category_id[0];
		} else {
			$data['category_id'] = 0;
		}

		if (isset($category_id[1])) {
			$data['child_id'] = $category_id[1];
		} else {
			$data['child_id'] = 0;
		}

		$data['categories'] = array();

		$this->load->model('extension/d_blog_module/category');
		$categories = $this->model_extension_d_blog_module_category->getCategories(0);
		
		foreach ($categories as $category) {
			$children_data = array();

			if ($category['category_id'] == $data['category_id']) {
				$children = $this->model_extension_d_blog_module_category->getCategories($category['category_id']);

				foreach($children as $child) {
					$filter_data = array('filter_category_id' => $child['category_id'], 'filter_sub_category' => true);

					$children_data[] = array(
						'category_id' => $child['category_id'],
						'name' => $child['title'] ,
						'href'  => $this->url->link('extension/d_blog_module/category', 'category_id=' . $child['category_id'], 'SSL')
					);
				}
			}

			$filter_data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true
			);

			$data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['title'],
				'children'    => $children_data,
				'href'        => $this->url->link('extension/d_blog_module/category', 'category_id=' . $category['category_id'])
			);
		}
		$data['category_blogs_title'] = $this->language->get('category_blogs_title');
		return $this->load->view('extension/module/categoryblogs', $data);
	}
}