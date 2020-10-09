<?php
class ControllerCommonCart extends Controller {
	public function index() {
		$this->load->language('common/cart');

		// Totals
		$this->load->model('setting/extension');

		$total = 0;			

		$data['text_items'] = sprintf($this->language->get('text_items1'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));

		return $this->load->view('common/cart', $data);
	}

	public function info() {
		$this->response->setOutput($this->index());
	}
}