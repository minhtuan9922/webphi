<?php
class ControllerExtensionModuleLatestblogs extends Controller {
	public function index() {
		$this->load->language('extension/module/category');


		$this->load->model('extension/d_blog_module/post');

		$data['posts'] = array();
		$limit = 5;
        $filter_data = array('limit' => $limit);
        $posts = $this->model_extension_d_blog_module_post->getLatestPosts($filter_data);
        if ($posts) {
            foreach ($posts as $post) {       
                $data['posts'][] = array(
                    'title'      =>  $post['title'],
                    'href'  => $this->url->link('extension/d_blog_module/post', 'post_id=' . $post['post_id'], 'SSL'),              
                    'images'   => "image/".$post['image'],
                    'short_description'   => $post['short_description']
                );
            }
        }
		$data['latest_blogs_title'] = $this->language->get('latest_blogs_title');
		return $this->load->view('extension/module/latestblogs', $data);
	}
}