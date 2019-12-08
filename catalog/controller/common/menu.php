<?php
class ControllerCommonMenu extends Controller {
	public function index() {
		$this->load->language('common/menu');

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				// $children_data = array();

				// $children = $this->model_catalog_category->getCategories($category['category_id']);

				// foreach ($children as $child) {
				// 	$filter_data = array(
				// 		'filter_category_id'  => $child['category_id'],
				// 		'filter_sub_category' => true
				// 	);

				// 	$children_data[] = array(
				// 		'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				// 		'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
				// 	);
				// }

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					//'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}

		$link_current = isset($this->request->get['route']) ? $this->request->get['route'] : 'common/home' ;
		$data['menus'] = array(
			array(
				'name'     => $this->language->get('text_home'),
				'column'   => 1,
				'active'   => $link_current == 'common/home' ? 'active' : '',
				'href'     => $this->url->link('common/home')
			),
			array(
				'name'     => $this->language->get('text_products'),
				'column'   => 1,
				'active'   => $link_current == 'product/category' ? 'active' : '',
				'href'     => $this->url->link('product/category', 'path=59' ),
				'children' => !empty($data['categories']) ? $data['categories'] : '',
			),
			array(
				'name'     => $this->language->get('text_blogs'),
				'column'   => 1,
				'active'   => $link_current == 'extension/d_blog_module/category' ? 'active' : '',
				'href'     => $this->url->link('extension/d_blog_module/category', 'category_id=1' )
			),
			array(
				'name'     => $this->language->get('text_about_us'),
				'column'   => 1,
				'active'   => $link_current == 'information/information' ? 'active' : '',
				'href'     => $this->url->link('information/information', 'information_id=4' )
			),
			array(
				'name'     => $this->language->get('text_contact'),
				'column'   => 1,
				'active'   => $link_current == 'information/contact' ? 'active' : '',
				'href'     => $this->url->link('information/contact')
			),

		);
		return $this->load->view('common/menu', $data);
	}
}
