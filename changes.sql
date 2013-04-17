alter table lcm_followup add bus_pass_given tinyint(1);

create VIEW `currently_supported` AS select `lcm_case`.`amount`, `lcm_case`.`legal_reason`, lcm_client.id_client, `lcm_client`.`name_first` AS `name_first`,`lcm_client`.`name_last` AS `name_last`,`lcm_case`.`id_case` AS `id_case` from ((`lcm_client` join `lcm_case_client_org` on((`lcm_client`.`id_client` = `lcm_case_client_org`.`id_client`))) join `lcm_case` on((`lcm_case_client_org`.`id_case` = `lcm_case`.`id_case`))) where ((`lcm_case`.`status` = 'open') and (`lcm_case`.`amount` > 0 or lcm_case.legal_reason = 'yes'));

update lcm_keyword set title = 'Welfare Desk Update' where title = 'Welfare Payment Attendance';

alter view `currently_supported` AS select lcm_case.type_case, `lcm_case`.`amount` AS `amount`,`lcm_case`.`legal_reason` AS `legal_reason`,`lcm_client`.`id_client` AS `id_client`,`lcm_client`.`name_first` AS `name_first`,`lcm_client`.`name_last` AS `name_last`,`lcm_case`.`id_case` AS `id_case` from ((`lcm_client` join `lcm_case_client_org` on((`lcm_client`.`id_client` = `lcm_case_client_org`.`id_client`))) join `lcm_case` on((`lcm_case_client_org`.`id_case` = `lcm_case`.`id_case`))) where ((`lcm_case`.`status` = 'open') and ((`lcm_case`.`amount` > 0) or (`lcm_case`.`legal_reason` = 'yes'));

CREATE TABLE `lcm_faowelfaredesk` (
  `id_client` int(11) NOT NULL,
  `amount` tinyint(4) DEFAULT NULL,
  `bus_pass` tinyint(1) DEFAULT NULL,
  `from_helpdesk` tinyint(1) DEFAULT NULL,
  `advocacy` tinyint(1) DEFAULT NULL,
  `letter` tinyint(1) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1);
