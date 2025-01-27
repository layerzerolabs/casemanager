<?php

class WelfareReportRow
{
	// first and last name and client id will be
	// combined, when decorated, into public link
	private $_name_first;
	private $_name_last; 
	private $_id_client;

	// array of WelfareReportEntry objects. 
	// An entry is a welfare payment made on a date
	public $entries;

	public function __construct($name_first, $name_last, $id_client) {
		$this->_name_first = $name_first;
		$this->_name_last = $name_last;
		$this->_id_client = $id_client;
	}

	public function addEntry(WelfareReportEntry $entry)
	{
		$this->entries[$entry->date] = $entry;
	}

	public function addDummyEntryIfNeeded($date)
	{
		if (!isset($this->entries[$date])) {
			$this->addEntry(new WelfareReportEntry($date, null, null));
		}
	}

	public function decorate(Decorator $decorator)
	{
		// sort the entries by date
		// make the link
		$this->link = $decorator->makeLink(
			$this->_id_client, $this->_name_first, $this->_name_last
		);
	}

	public function getCashGivenOn($date)
	{
		$entry = $this->entries[$date];
		return $entry->amount;
	}

	public function getBusPassesGivenOn($date)
        {
                $entry = $this->entries[$date];
                return (int)$entry->bus_pass;
        }

}
?>
