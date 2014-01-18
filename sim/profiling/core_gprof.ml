Flat profile:

Each sample counts as 0.01 seconds.
  %   cumulative   self              self     total           
 time   seconds   seconds    calls   s/call   s/call  name    
 13.22      0.46     0.46 15088151     0.00     0.00  compare_val
 10.63      0.83     0.37       89     0.00     0.00  mark_slice
  7.76      1.10     0.27  4201415     0.00     0.00  camlHashtbl__find_1093
  7.76      1.37     0.27  2813812     0.00     0.00  camlHashtbl__replace_bucket_1116
  6.90      1.61     0.24  7040291     0.00     0.00  hash_aux
  6.61      1.84     0.23  6480079     0.00     0.00  caml_oldify_one
  5.17      2.02     0.18 14738368     0.00     0.00  caml_compare
  3.88      2.15     0.14      127     0.00     0.00  sweep_slice
  3.74      2.29     0.13 30955528     0.00     0.00  caml_string_length
  3.74      2.42     0.13  2813685     0.00     0.00  camlCore__evalExp_1171
  3.45      2.54     0.12      216     0.00     0.00  caml_oldify_mopup
  3.16      2.65     0.11  2813812     0.00     0.00  camlHashtbl__replace_1112
  3.16      2.75     0.11      127     0.00     0.02  camlCore__applyEq_1259
  2.87      2.85     0.10  8207956     0.00     0.00  caml_modify
  2.59      2.94     0.09  7290014     0.00     0.00  caml_fl_allocate
  2.30      3.02     0.08  6994147     0.00     0.00  caml_fl_merge_block
  1.72      3.08     0.06  7289998     0.00     0.00  allocate_block
  1.44      3.13     0.05   597535     0.00     0.00  camlArray__sub_1081
  1.15      3.17     0.04  7289998     0.00     0.00  caml_alloc_shr
  1.15      3.21     0.04                             caml_c_call
  0.86      3.25     0.03  4384040     0.00     0.00  camlCore__evalArg_1120
  0.86      3.27     0.03   933392     0.00     0.00  caml_make_vect
  0.86      3.31     0.03      432     0.00     0.00  caml_empty_minor_heap
  0.57      3.33     0.02  7040291     0.00     0.00  caml_hash_univ_param
  0.57      3.35     0.02   750062     0.00     0.00  camlCore__evalBinop_1123
  0.57      3.37     0.02   347247     0.00     0.00  camlLexing__engine_1090
  0.57      3.38     0.02   347247     0.00     0.00  caml_lex_engine
  0.57      3.40     0.02   335534     0.00     0.00  camlArray__append_1054
  0.57      3.42     0.02    98364     0.00     0.00  camlList__assoc_1169
  0.29      3.44     0.01   933387     0.00     0.00  caml_alloc_small
  0.29      3.44     0.01   349758     0.00     0.00  caml_notequal
  0.29      3.46     0.01    18088     0.00     0.00  camlNetlist_parser___menhir_run12_1234
  0.29      3.46     0.01        5     0.00     0.00  caml_equal
  0.29      3.48     0.01                             compare_stack_overflow
  0.14      3.48     0.01   873056     0.00     0.00  caml_darken
  0.00      3.48     0.00 16628563     0.00     0.00  caml_debugger_cleanup_fork
  0.00      3.48     0.00   750062     0.00     0.00  camlCore__fun_1348
  0.00      3.48     0.00   351992     0.00     0.00  caml_apply2
  0.00      3.48     0.00   343671     0.00     0.00  camlNetlist_lexer____ocaml_lex_token_rec_1083
  0.00      3.48     0.00   343671     0.00     0.00  camlNetlist_lexer__token_1082
  0.00      3.48     0.00   327511     0.00     0.00  camlNetlist_ast__compare_1032
  0.00      3.48     0.00   326526     0.00     0.00  camlHashtbl__find_rec_1088
  0.00      3.48     0.00   321713     0.00     0.00  camlMap__bal_1081
  0.00      3.48     0.00   225631     0.00     0.00  caml_blit_string
  0.00      3.48     0.00   221650     0.00     0.00  caml_alloc_string
  0.00      3.48     0.00   221419     0.00     0.00  caml_create_string
  0.00      3.48     0.00   175279     0.00     0.00  camlNetlist_parser___menhir_discard_1243
  0.00      3.48     0.00   122762     0.00     0.00  camlLexing__sub_lexeme_1126
  0.00      3.48     0.00    98364     0.00     0.00  camlLexing__lexeme_1122
  0.00      3.48     0.00    46250     0.00     0.00  parse_digit
  0.00      3.48     0.00    44280     0.00     0.00  camlMap__create_1071
  0.00      3.48     0.00    34521     0.00     0.00  camlNetlist_parser___menhir_goto_arg_1225
  0.00      3.48     0.00    32918     0.00     0.00  camlNetlist_parser___menhir_run24_1229
  0.00      3.48     0.00    26662     0.00     0.00  camlLexing__new_line_1155
  0.00      3.48     0.00    26193     0.00     0.00  caml_process_pending_signals
  0.00      3.48     0.00    24885     0.00     0.00  camlHashtbl__hash_1031
  0.00      3.48     0.00    24690     0.00     0.00  caml_initialize
  0.00      3.48     0.00    22795     0.00     0.00  caml_int_of_string
  0.00      3.48     0.00    22795     0.00     0.00  parse_intnat
  0.00      3.48     0.00    22795     0.00     0.00  parse_sign_and_base
  0.00      3.48     0.00    22156     0.00     0.00  camlMap__add_1108
  0.00      3.48     0.00    22156     0.00     0.00  camlNetlist_ast__fun_1245
  0.00      3.48     0.00    22156     0.00     0.00  camlNetlist_parser___menhir_goto_ty_exp_1233
  0.00      3.48     0.00    22156     0.00     0.00  camlNetlist_parser___menhir_run10_1236
  0.00      3.48     0.00    22155     0.00     0.00  camlNetlist_parser___menhir_goto_exp_1227
  0.00      3.48     0.00    22155     0.00     0.00  camlNetlist_parser___menhir_run21_1232
  0.00      3.48     0.00    20320     0.00     0.00  camlCore__oldValue_1252
  0.00      3.48     0.00    13003     0.00     0.00  caml_enter_blocking_section
  0.00      3.48     0.00    13003     0.00     0.00  caml_enter_blocking_section_default
  0.00      3.48     0.00    13003     0.00     0.00  caml_leave_blocking_section
  0.00      3.48     0.00    13003     0.00     0.00  caml_leave_blocking_section_default
  0.00      3.48     0.00    12573     0.00     0.00  camlMain__aux_1122
  0.00      3.48     0.00    12439     0.00     0.00  camlHashtbl__insert_bucket_1068
  0.00      3.48     0.00     4285     0.00     0.00  camlString__blit_1056
  0.00      3.48     0.00     2417     0.00     0.00  caml_page_table_modify
  0.00      3.48     0.00     2318     0.00     0.00  camlLexing__fun_1200
  0.00      3.48     0.00     2318     0.00     0.00  camlLexing__lex_refill_1100
  0.00      3.48     0.00     2318     0.00     0.00  camlPervasives__input_1224
  0.00      3.48     0.00     2318     0.00     0.00  caml_curry3_2
  0.00      3.48     0.00     2318     0.00     0.00  caml_ml_input
  0.00      3.48     0.00     2248     0.00     0.00  caml_string_equal
  0.00      3.48     0.00     2248     0.00     0.00  caml_string_notequal
  0.00      3.48     0.00     2185     0.00     0.00  caml_gc_message
  0.00      3.48     0.00     1603     0.00     0.00  camlNetlist_parser___menhir_run25_1230
  0.00      3.48     0.00     1603     0.00     0.00  camlNetlist_parser__bool_of_string_1215
  0.00      3.48     0.00     1603     0.00     0.00  camlNetlist_parser__value_of_const_1221
  0.00      3.48     0.00      712     0.00     0.00  camlSim_lexer____ocaml_lex_comment_rec_1043
  0.00      3.48     0.00      712     0.00     0.00  camlSim_lexer__comment_1042
  0.00      3.48     0.00      564     0.00     0.00  caml_iterate_global_roots
  0.00      3.48     0.00      546     0.00     0.00  camlSim_lexer____ocaml_lex_token_rec_1041
  0.00      3.48     0.00      546     0.00     0.00  camlSim_lexer__token_1040
  0.00      3.48     0.00      432     0.00     0.00  caml_final_empty_young
  0.00      3.48     0.00      432     0.00     0.00  clear_table
  0.00      3.48     0.00      414     0.00     0.00  camlMap__find_1117
  0.00      3.48     0.00      381     0.00     0.00  camlCore__array_of_value_1110
  0.00      3.48     0.00      381     0.00     0.00  camlCore__getAddr_1145
  0.00      3.48     0.00      293     0.00     0.00  caml_do_read
  0.00      3.48     0.00      255     0.00     0.00  camlList__iter_1074
  0.00      3.48     0.00      254     0.00     0.00  camlCore__fixSize_1128
  0.00      3.48     0.00      254     0.00     0.00  camlCore__getWord_1135
  0.00      3.48     0.00      254     0.00     0.00  camlMain__fun_1166
  0.00      3.48     0.00      216     0.00     0.00  caml_final_do_calls
  0.00      3.48     0.00      216     0.00     0.00  caml_final_do_young_roots
  0.00      3.48     0.00      216     0.00     0.00  caml_major_collection_slice
  0.00      3.48     0.00      216     0.00     0.01  caml_minor_collection
  0.00      3.48     0.00      216     0.00     0.00  caml_oldify_local_roots
  0.00      3.48     0.00      216     0.00     0.00  caml_scan_global_young_roots
  0.00      3.48     0.00      187     0.00     0.01  caml_garbage_collection
  0.00      3.48     0.00      179     0.00     0.00  camlHashtbl__add_1074
  0.00      3.48     0.00      179     0.00     0.00  camlList__rev_append_1051
  0.00      3.48     0.00      178     0.00     0.00  camlArray__of_list_1130
  0.00      3.48     0.00      178     0.00     0.00  camlMain__fun_1160
  0.00      3.48     0.00      178     0.00     0.00  camlSim_lexer__handleNewline_1037
  0.00      3.48     0.00      160     0.00     0.00  camlCore__evalDefault_1249
  0.00      3.48     0.00      127     0.00     0.00  camlArray__iter_1101
  0.00      3.48     0.00      127     0.00     0.00  camlCore__addInput_1224
  0.00      3.48     0.00      127     0.00     0.00  camlCore__aux_1231
  0.00      3.48     0.00      127     0.00     0.00  camlCore__bool_of_value_1113
  0.00      3.48     0.00      127     0.00     0.00  camlCore__fun_1374
  0.00      3.48     0.00      127     0.00     0.00  camlCore__getOutput_1265
  0.00      3.48     0.00      127     0.00     0.00  camlCore__getRamTable_1168
  0.00      3.48     0.00      127     0.00     0.00  camlCore__ramHandler_1158
  0.00      3.48     0.00      127     0.00     0.02  camlCore__tic_1245
  0.00      3.48     0.00      127     0.00     0.00  camlCore__var_list_length_1219
  0.00      3.48     0.00      127     0.00     0.00  camlMain__check_power_1126
  0.00      3.48     0.00      127     0.00     0.00  camlMain__output_1120
  0.00      3.48     0.00      117     0.00     0.00  caml_copy_string
  0.00      3.48     0.00      110     0.00     0.00  camlDigest__string_1033
  0.00      3.48     0.00      110     0.00     0.00  camlPervasives__$5e_1112
  0.00      3.48     0.00      110     0.00     0.00  camlPervasives__string_of_int_1130
  0.00      3.48     0.00      110     0.00     0.00  camlRandom__extract_1046
  0.00      3.48     0.00      110     0.00     0.00  caml_MD5Final
  0.00      3.48     0.00      110     0.00     0.00  caml_MD5Init
  0.00      3.48     0.00      110     0.00     0.00  caml_MD5Transform
  0.00      3.48     0.00      110     0.00     0.00  caml_MD5Update
  0.00      3.48     0.00      110     0.00     0.00  caml_format_int
  0.00      3.48     0.00      110     0.00     0.00  caml_md5_string
  0.00      3.48     0.00      110     0.00     0.00  parse_format
  0.00      3.48     0.00      106     0.00     0.00  camlFormat__peek_queue_1186
  0.00      3.48     0.00       58     0.00     0.00  caml_page_table_add
  0.00      3.48     0.00       56     0.00     0.00  camlFormat__add_queue_1180
  0.00      3.48     0.00       56     0.00     0.00  caml_stat_alloc
  0.00      3.48     0.00       54     0.00     0.00  caml_apply3
  0.00      3.48     0.00       54     0.00     0.00  caml_curry4_1
  0.00      3.48     0.00       54     0.00     0.00  caml_curry4_2
  0.00      3.48     0.00       53     0.00     0.00  camlFormat__advance_left_1277
  0.00      3.48     0.00       53     0.00     0.00  camlFormat__advance_loop_1271
  0.00      3.48     0.00       53     0.00     0.00  camlFormat__format_pp_token_1227
  0.00      3.48     0.00       53     0.00     0.00  camlFormat__take_queue_1188
  0.00      3.48     0.00       53     0.00     0.00  caml_curry2
  0.00      3.48     0.00       52     0.00     0.00  camlPervasives__output_1194
  0.00      3.48     0.00       52     0.00     0.00  caml_curry4_3
  0.00      3.48     0.00       52     0.00     0.00  caml_ml_output
  0.00      3.48     0.00       52     0.00     0.00  caml_putblock
  0.00      3.48     0.00       51     0.00     0.00  camlArray__fill_1135
  0.00      3.48     0.00       51     0.00     0.00  camlArray__list_length_1126
  0.00      3.48     0.00       49     0.00     0.00  camlFormat__enqueue_advance_1279
  0.00      3.48     0.00       49     0.00     0.00  camlFormat__enqueue_string_as_1286
  0.00      3.48     0.00       49     0.00     0.00  camlFormat__pp_output_string_1199
  0.00      3.48     0.00       49     0.00     0.00  camlFormat__pp_print_as_char_1619
  0.00      3.48     0.00       49     0.00     0.00  camlFormat__pp_print_char_1374
  0.00      3.48     0.00       45     0.00     0.00  caml_fl_init_merge
  0.00      3.48     0.00       44     0.00     0.00  caml_darken_all_roots
  0.00      3.48     0.00       44     0.00     0.00  caml_do_local_roots
  0.00      3.48     0.00       44     0.00     0.00  caml_do_roots
  0.00      3.48     0.00       44     0.00     0.00  caml_final_do_strong_roots
  0.00      3.48     0.00       44     0.00     0.00  caml_final_update
  0.00      3.48     0.00       44     0.00     0.00  caml_scan_global_roots
  0.00      3.48     0.00       44     0.00     0.00  start_cycle
  0.00      3.48     0.00       43     0.00     0.00  caml_compact_heap_maybe
  0.00      3.48     0.00       40     0.00     0.00  caml_register_frametable
  0.00      3.48     0.00       40     0.00     0.00  cons
  0.00      3.48     0.00       18     0.00     0.00  caml_aligned_malloc
  0.00      3.48     0.00       17     0.00     0.00  caml_alloc_for_heap
  0.00      3.48     0.00       17     0.00     0.00  clip_heap_chunk_size
  0.00      3.48     0.00       16     0.00     0.00  caml_add_to_heap
  0.00      3.48     0.00       16     0.00     0.00  caml_fl_add_blocks
  0.00      3.48     0.00       16     0.00     0.00  caml_round_heap_chunk_size
  0.00      3.48     0.00       15     0.00     0.00  caml_check_urgent_gc
  0.00      3.48     0.00       13     0.00     0.00  camlPervasives__min_1022
  0.00      3.48     0.00       13     0.00     0.00  caml_lessequal
  0.00      3.48     0.00       10     0.00     0.00  caml_copy_double
  0.00      3.48     0.00        8     0.00     0.00  caml_curry3
  0.00      3.48     0.00        7     0.00     0.00  camlHashtbl__resize_1061
  0.00      3.48     0.00        7     0.00     0.00  camlPervasives__max_1025
  0.00      3.48     0.00        7     0.00     0.00  caml_adjust_gc_speed
  0.00      3.48     0.00        7     0.00     0.00  caml_alloc_channel
  0.00      3.48     0.00        7     0.00     0.00  caml_alloc_custom
  0.00      3.48     0.00        7     0.00     0.00  caml_curry2_1
  0.00      3.48     0.00        7     0.00     0.00  caml_greaterequal
  0.00      3.48     0.00        6     0.00     0.00  camlHashtbl__create_1051
  0.00      3.48     0.00        6     0.00     0.00  caml_flush
  0.00      3.48     0.00        6     0.00     0.00  caml_flush_partial
  0.00      3.48     0.00        6     0.00     0.00  caml_int64_float_of_bits
  0.00      3.48     0.00        6     0.00     0.00  caml_ml_flush
  0.00      3.48     0.00        6     0.00     0.00  realloc_gray_vals
  0.00      3.48     0.00        5     0.00     0.00  caml_curry4
  0.00      3.48     0.00        5     0.00     0.00  caml_open_descriptor_in
  0.00      3.48     0.00        4     0.00     0.00  camlFormat__fun_2097
  0.00      3.48     0.00        4     0.00     0.00  camlFormat__pp_clear_queue_1196
  0.00      3.48     0.00        4     0.00     0.00  camlFormat__pp_flush_queue_1351
  0.00      3.48     0.00        4     0.00     0.00  camlFormat__pp_open_box_gen_1312
  0.00      3.48     0.00        4     0.00     0.00  camlFormat__pp_rinit_1349
  0.00      3.48     0.00        4     0.00     0.00  camlFormat__scan_push_1308
  0.00      3.48     0.00        4     0.00     0.00  caml_curry3_1
  0.00      3.48     0.00        4     0.00     0.00  caml_stat_free
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__display_newline_1469
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__doprn_1625
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__eprintf_1772
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__fprintf_1766
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__fun_2645
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__fun_2653
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__kfprintf_1760
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__kpr_1614
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__kprintf_1610
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__make_formatter_1493
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__mkprintf_1607
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__pp_make_formatter_1485
  0.00      3.48     0.00        3     0.00     0.00  camlFormat__pp_print_newline_1392
  0.00      3.48     0.00        3     0.00     0.00  camlPrintf__ac_of_format_1184
  0.00      3.48     0.00        3     0.00     0.00  camlPrintf__index_of_int_1037
  0.00      3.48     0.00        3     0.00     0.00  camlPrintf__iter_on_format_args_1137
  0.00      3.48     0.00        3     0.00     0.00  camlPrintf__kapr_1209
  0.00      3.48     0.00        3     0.00     0.00  camlPrintf__scan_fmt_1144
  0.00      3.48     0.00        3     0.00     0.00  caml_ml_open_descriptor_in
  0.00      3.48     0.00        3     0.00     0.00  caml_register_custom_operations
  0.00      3.48     0.00        3     0.00     0.00  do_write
  0.00      3.48     0.00        2     0.00     0.00  camlArg__assoc3_1092
  0.00      3.48     0.00        2     0.00     0.00  camlArg__treat_action_1154
  0.00      3.48     0.00        2     0.00     0.00  camlBuffer__create_1039
  0.00      3.48     0.00        2     0.00     0.00  camlFormat__formatter_of_out_channel_1497
  0.00      3.48     0.00        2     0.00     0.00  camlLexing__from_channel_1115
  0.00      3.48     0.00        2     0.00     0.00  camlLexing__from_function_1113
  0.00      3.48     0.00        2     0.00     0.00  camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_NAME___1238
  0.00      3.48     0.00        2     0.00     0.00  camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_NAME__1239
  0.00      3.48     0.00        2     0.00     0.00  camlNetlist_parser___menhir_run2_1242
  0.00      3.48     0.00        2     0.00     0.00  camlPervasives__open_in_1218
  0.00      3.48     0.00        2     0.00     0.00  camlPervasives__open_in_gen_1214
  0.00      3.48     0.00        2     0.00     0.00  caml_convert_flag_list
  0.00      3.48     0.00        2     0.00     0.00  caml_finalize_channel
  0.00      3.48     0.00        2     0.00     0.00  caml_insert_global_root
  0.00      3.48     0.00        2     0.00     0.00  caml_ml_open_descriptor_out
  0.00      3.48     0.00        2     0.00     0.00  caml_open_descriptor_out
  0.00      3.48     0.00        2     0.00     0.00  caml_raise
  0.00      3.48     0.00        2     0.00     0.00  caml_raise_constant
  0.00      3.48     0.00        2     0.00     0.00  caml_raise_not_found
  0.00      3.48     0.00        2     0.00     0.00  caml_register_global_root
  0.00      3.48     0.00        2     0.00     0.00  caml_register_named_value
  0.00      3.48     0.00        2     0.00     0.00  caml_sys_getenv
  0.00      3.48     0.00        2     0.00     0.00  caml_sys_open
  0.00      3.48     0.00        2     0.00     0.00  hash_value_name
  0.00      3.48     0.00        2     0.00     0.00  norm_heapincr
  0.00      3.48     0.00        2     0.00     0.00  reset_table
  0.00      3.48     0.00        2     0.00     0.00  unlink_channel
  0.00      3.48     0.00        1     0.00     0.00  camlArg__entry
  0.00      3.48     0.00        1     0.00     2.43  camlArg__parse_1178
  0.00      3.48     0.00        1     0.00     2.43  camlArg__parse_argv_1132
  0.00      3.48     0.00        1     0.00     0.00  camlArray__entry
  0.00      3.48     0.00        1     0.00     0.00  camlBuffer__entry
  0.00      3.48     0.00        1     0.00     0.00  camlCallback__entry
  0.00      3.48     0.00        1     0.00     0.00  camlCallback__register_exception_1034
  0.00      3.48     0.00        1     0.00     0.00  camlChar__entry
  0.00      3.48     0.00        1     0.00     0.00  camlCore__entry
  0.00      3.48     0.00        1     0.00     0.00  camlDebug__entry
  0.00      3.48     0.00        1     0.00     0.00  camlDigest__entry
  0.00      3.48     0.00        1     0.00     0.00  camlFilename__entry
  0.00      3.48     0.00        1     0.00     0.00  camlFormat__entry
  0.00      3.48     0.00        1     0.00     0.00  camlFormat__formatter_of_buffer_1499
  0.00      3.48     0.00        1     0.00     0.00  camlFormat__pp_print_flush_1393
  0.00      3.48     0.00        1     0.00     0.00  camlGraph__entry
  0.00      3.48     0.00        1     0.00     0.00  camlHashtbl__entry
  0.00      3.48     0.00        1     0.00     0.00  camlInt32__entry
  0.00      3.48     0.00        1     0.00     0.00  camlInt64__entry
  0.00      3.48     0.00        1     0.00     0.00  camlLexing__entry
  0.00      3.48     0.00        1     0.00     0.00  camlList__entry
  0.00      3.48     0.00        1     0.00     0.02  camlList__fold_left_1078
  0.00      3.48     0.00        1     0.00     2.43  camlMain__entry
  0.00      3.48     0.00        1     0.00     0.00  camlMain__loadRom_1111
  0.00      3.48     0.00        1     0.00     2.23  camlMain__run_1133
  0.00      3.48     0.00        1     0.00     2.42  camlMain__simulate_1115
  0.00      3.48     0.00        1     0.00     0.00  camlMap__Make_1355
  0.00      3.48     0.00        1     0.00     0.00  camlMap__entry
  0.00      3.48     0.00        1     0.00     0.00  camlMap__fun_1920
  0.00      3.48     0.00        1     0.00     0.00  camlMarshal__entry
  0.00      3.48     0.00        1     0.00     0.00  camlNativeint__entry
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist__entry
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist__find_file_1031
  0.00      3.48     0.00        1     0.00     0.19  camlNetlist__read_file_1033
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_ast__entry
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_ast__of_list_1114
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_lexer__entry
  0.00      3.48     0.00        1     0.00     0.02  camlNetlist_parser___menhir_goto_list_equ__1226
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_var___1235
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_var__1228
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_parser___menhir_reduce18_1231
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_parser__entry
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_parser__program_1244
  0.00      3.48     0.00        1     0.00     0.00  camlNetlist_printer__entry
  0.00      3.48     0.00        1     0.00     0.00  camlObj__entry
  0.00      3.48     0.00        1     0.00     0.00  camlParsing__entry
  0.00      3.48     0.00        1     0.00     0.00  camlPervasives__at_exit_1322
  0.00      3.48     0.00        1     0.00     0.00  camlPervasives__entry
  0.00      3.48     0.00        1     0.00     0.00  camlPervasives__exit_1326
  0.00      3.48     0.00        1     0.00     0.00  camlPervasives__flush_all_1185
  0.00      3.48     0.00        1     0.00     0.00  camlPervasives__fun_1500
  0.00      3.48     0.00        1     0.00     0.00  camlPervasives__iter_1186
  0.00      3.48     0.00        1     0.00     0.00  camlPrintexc__entry
  0.00      3.48     0.00        1     0.00     0.00  camlPrintf__entry
  0.00      3.48     0.00        1     0.00     0.00  camlRandom__entry
  0.00      3.48     0.00        1     0.00     0.00  camlRandom__full_init_1040
  0.00      3.48     0.00        1     0.00     0.00  camlRandom__make_self_init_1058
  0.00      3.48     0.00        1     0.00     0.00  camlRandom__new_state_1036
  0.00      3.48     0.00        1     0.00     0.00  camlScheduler__entry
  0.00      3.48     0.00        1     0.00     0.00  camlSim_lexer__entry
  0.00      3.48     0.00        1     0.00     0.00  camlSim_lexer__read_file_1053
  0.00      3.48     0.00        1     0.00     0.00  camlString__entry
  0.00      3.48     0.00        1     0.00     0.00  camlString__make_1038
  0.00      3.48     0.00        1     0.00     0.00  camlSys__entry
  0.00      3.48     0.00        1     0.00     0.00  caml_alloc
  0.00      3.48     0.00        1     0.00     0.00  caml_alloc_array
  0.00      3.48     0.00        1     0.00     0.00  caml_alloc_table
  0.00      3.48     0.00        1     0.00     0.00  caml_copy_string_array
  0.00      3.48     0.00        1     0.00     0.00  caml_curry5
  0.00      3.48     0.00        1     0.00     0.00  caml_debugger_init
  0.00      3.48     0.00        1     0.00     0.00  caml_executable_name
  0.00      3.48     0.00        1     0.00     0.00  caml_fill_string
  0.00      3.48     0.00        1     0.00     0.00  caml_init_custom_operations
  0.00      3.48     0.00        1     0.00     0.00  caml_init_frame_descriptors
  0.00      3.48     0.00        1     0.00     0.00  caml_init_gc
  0.00      3.48     0.00        1     0.00     0.00  caml_init_ieee_floats
  0.00      3.48     0.00        1     0.00     0.00  caml_init_major_heap
  0.00      3.48     0.00        1     0.00     0.00  caml_init_signals
  0.00      3.48     0.00        1     0.00     0.00  caml_main
  0.00      3.48     0.00        1     0.00     0.00  caml_make_free_blocks
  0.00      3.48     0.00        1     0.00     0.00  caml_ml_out_channels_list
  0.00      3.48     0.00        1     0.00     0.00  caml_obj_dup
  0.00      3.48     0.00        1     0.00     0.00  caml_page_table_initialize
  0.00      3.48     0.00        1     0.00     2.43  caml_program
  0.00      3.48     0.00        1     0.00     0.00  caml_realloc_ref_table
  0.00      3.48     0.00        1     0.00     0.00  caml_set_minor_heap_size
  0.00      3.48     0.00        1     0.00     0.00  caml_sys_exit
  0.00      3.48     0.00        1     0.00     0.00  caml_sys_get_argv
  0.00      3.48     0.00        1     0.00     0.00  caml_sys_get_config
  0.00      3.48     0.00        1     0.00     0.00  caml_sys_init
  0.00      3.48     0.00        1     0.00     0.00  caml_sys_random_seed
  0.00      3.48     0.00        1     0.00     0.00  norm_minsize
  0.00      3.48     0.00        1     0.00     0.00  norm_pfree
  0.00      3.48     0.00        1     0.00     0.00  norm_pmax

 %         the percentage of the total running time of the
time       program used by this function.

cumulative a running sum of the number of seconds accounted
 seconds   for by this function and those listed above it.

 self      the number of seconds accounted for by this
seconds    function alone.  This is the major sort for this
           listing.

calls      the number of times this function was invoked, if
           this function is profiled, else blank.
 
 self      the average number of milliseconds spent in this
ms/call    function per call, if this function is profiled,
	   else blank.

 total     the average number of milliseconds spent in this
ms/call    function and its descendents per call, if this 
	   function is profiled, else blank.

name       the name of the function.  This is the minor sort
           for this listing. The index shows the location of
	   the function in the gprof listing. If the index is
	   in parenthesis it shows where it would appear in
	   the gprof listing if it were to be printed.

		     Call graph (explanation follows)


granularity: each sample hit covers 4 byte(s) for 0.29% of 3.48 seconds

index % time    self  children    called     name
                0.00    2.43       1/1           caml_start_program [2]
[1]     69.8    0.00    2.43       1         caml_program [1]
                0.00    2.43       1/1           camlMain__entry [3]
                0.00    0.00       1/1           camlFilename__entry [67]
                0.00    0.00       1/1           camlSys__entry [120]
                0.00    0.00       1/1           camlParsing__entry [123]
                0.00    0.00       1/1           camlCore__entry [126]
                0.00    0.00       1/1           camlFormat__entry [140]
                0.00    0.00       1/1           camlRandom__entry [149]
                0.00    0.00       1/1           camlPervasives__entry [160]
                0.00    0.00       1/1           camlArray__entry [302]
                0.00    0.00       1/1           camlList__entry [315]
                0.00    0.00       1/1           camlChar__entry [306]
                0.00    0.00       1/1           camlString__entry [335]
                0.00    0.00       1/1           camlHashtbl__entry [311]
                0.00    0.00       1/1           camlMarshal__entry [319]
                0.00    0.00       1/1           camlObj__entry [329]
                0.00    0.00       1/1           camlInt32__entry [312]
                0.00    0.00       1/1           camlInt64__entry [313]
                0.00    0.00       1/1           camlNativeint__entry [320]
                0.00    0.00       1/1           camlLexing__entry [314]
                0.00    0.00       1/1           camlMap__entry [317]
                0.00    0.00       1/1           camlBuffer__entry [303]
                0.00    0.00       1/1           camlPrintf__entry [332]
                0.00    0.00       1/1           camlArg__entry [301]
                0.00    0.00       1/1           camlPrintexc__entry [331]
                0.00    0.00       1/1           camlDigest__entry [308]
                0.00    0.00       1/1           camlCallback__entry [304]
                0.00    0.00       1/1           camlDebug__entry [307]
                0.00    0.00       1/1           camlNetlist_ast__entry [322]
                0.00    0.00       1/1           camlNetlist_parser__entry [327]
                0.00    0.00       1/1           camlNetlist_lexer__entry [324]
                0.00    0.00       1/1           camlNetlist__entry [321]
                0.00    0.00       1/1           camlNetlist_printer__entry [328]
                0.00    0.00       1/1           camlGraph__entry [310]
                0.00    0.00       1/1           camlScheduler__entry [333]
                0.00    0.00       1/1           camlSim_lexer__entry [334]
-----------------------------------------------
                                                 <spontaneous>
[2]     69.8    0.00    2.43                 caml_start_program [2]
                0.00    2.43       1/1           caml_program [1]
-----------------------------------------------
                0.00    2.43       1/1           caml_program [1]
[3]     69.8    0.00    2.43       1         camlMain__entry [3]
                0.00    2.43       1/1           camlArg__parse_1178 [4]
                0.00    0.00       2/6           camlHashtbl__create_1051 [115]
                0.00    0.00       6/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    2.43       1/1           camlMain__entry [3]
[4]     69.8    0.00    2.43       1         camlArg__parse_1178 [4]
                0.00    2.43       1/1           camlArg__parse_argv_1132 [5]
-----------------------------------------------
                0.00    2.43       1/1           camlArg__parse_1178 [4]
[5]     69.8    0.00    2.43       1         camlArg__parse_argv_1132 [5]
                0.00    2.42       1/1           camlMain__simulate_1115 [6]
                0.00    0.01       2/2           camlArg__assoc3_1092 [63]
                0.00    0.00       1/1           camlPervasives__exit_1326 [127]
                0.00    0.00       1/2           camlBuffer__create_1039 [153]
                0.00    0.00       2/2           camlArg__treat_action_1154 [168]
-----------------------------------------------
                0.00    2.42       1/1           camlArg__parse_argv_1132 [5]
[6]     69.5    0.00    2.42       1         camlMain__simulate_1115 [6]
                0.00    2.23       1/1           camlMain__run_1133 [7]
                0.00    0.19       1/1           camlNetlist__read_file_1033 [30]
                0.00    0.00       1/1           camlMain__loadRom_1111 [79]
                0.00    0.00       3/3           camlFormat__doprn_1625 [108]
                0.00    0.00       3/3           camlFormat__fun_2653 [274]
                0.00    0.00       3/3           camlFormat__kpr_1614 [276]
                0.00    0.00       3/351992      caml_apply2 [177]
                0.00    0.00       3/3           camlPrintf__kapr_1209 [282]
                0.00    0.00       3/3           camlFormat__kprintf_1610 [277]
                0.00    0.00       3/7           caml_curry2_1 [258]
                0.00    0.00       3/3           camlFormat__eprintf_1772 [271]
-----------------------------------------------
                0.00    2.23       1/1           camlMain__simulate_1115 [6]
[7]     64.1    0.00    2.23       1         camlMain__run_1133 [7]
                0.00    2.23     127/127         camlCore__tic_1245 [8]
                0.00    0.00     127/127         camlCore__getOutput_1265 [92]
                0.00    0.00     127/127         camlMain__check_power_1126 [109]
-----------------------------------------------
                0.00    2.23     127/127         camlMain__run_1133 [7]
[8]     64.1    0.00    2.23     127         camlCore__tic_1245 [8]
                0.11    2.12     127/127         camlCore__applyEq_1259 [9]
                0.00    0.00     127/127         camlCore__aux_1231 [82]
                0.00    0.00     127/127         camlCore__addInput_1224 [86]
                0.00    0.00     127/255         camlList__iter_1074 [99]
                0.00    0.00     254/8207956     caml_modify [38]
-----------------------------------------------
                0.11    2.12     127/127         camlCore__tic_1245 [8]
[9]     64.1    0.11    2.12     127         camlCore__applyEq_1259 [9]
                0.13    1.14 2813685/2813685     camlCore__evalExp_1171 [10]
                0.11    0.68 2813685/2813812     camlHashtbl__replace_1112 [16]
                0.00    0.03  150749/4384040     camlCore__evalArg_1120 [14]
                0.00    0.02  750062/750062      camlCore__fun_1348 [48]
                0.00    0.00   20320/20320       camlCore__oldValue_1252 [66]
                0.00    0.00       7/7           camlHashtbl__resize_1061 [71]
                0.00    0.00     254/254         camlCore__fixSize_1128 [81]
                0.00    0.00     160/160         camlCore__evalDefault_1249 [83]
                0.00    0.00     254/254         camlCore__getWord_1135 [91]
                0.00    0.00     127/127         camlCore__ramHandler_1158 [220]
-----------------------------------------------
                0.13    1.14 2813685/2813685     camlCore__applyEq_1259 [9]
[10]    36.6    0.13    1.14 2813685         camlCore__evalExp_1171 [10]
                0.03    0.79 4233291/4384040     camlCore__evalArg_1120 [14]
                0.05    0.14  597535/597535      camlArray__sub_1081 [28]
                0.02    0.09  335280/335534      camlArray__append_1054 [37]
                0.02    0.00  750062/750062      camlCore__evalBinop_1123 [53]
                0.00    0.00     127/127         camlCore__getRamTable_1168 [94]
                0.00    0.00     127/381         camlCore__getAddr_1145 [211]
                0.00    0.00      16/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.02       3/216         caml_alloc_string [55]
                0.00    0.14      26/216         caml_alloc_small [35]
                0.00    1.00     187/216         caml_garbage_collection [12]
[11]    33.2    0.00    1.16     216         caml_minor_collection [11]
                0.00    0.59     216/216         caml_major_collection_slice [18]
                0.03    0.54     432/432         caml_empty_minor_heap [19]
                0.00    0.00     216/216         caml_final_do_calls [214]
-----------------------------------------------
                0.00    1.00     187/187         caml_call_gc [13]
[12]    28.7    0.00    1.00     187         caml_garbage_collection [12]
                0.00    1.00     187/216         caml_minor_collection [11]
                0.00    0.00     187/26193       caml_process_pending_signals [184]
-----------------------------------------------
                                                 <spontaneous>
[13]    28.7    0.00    1.00                 caml_call_gc [13]
                0.00    1.00     187/187         caml_garbage_collection [12]
-----------------------------------------------
                0.00    0.03  150749/4384040     camlCore__applyEq_1259 [9]
                0.03    0.79 4233291/4384040     camlCore__evalExp_1171 [10]
[14]    24.5    0.03    0.82 4384040         camlCore__evalArg_1120 [14]
                0.27    0.53 4180459/4201415     camlHashtbl__find_1093 [15]
                0.00    0.02  326492/326526      camlHashtbl__find_rec_1088 [50]
-----------------------------------------------
                0.00    0.00     128/4201415     camlCore__getRamTable_1168 [94]
                0.00    0.00     254/4201415     camlCore__getOutput_1265 [92]
                0.00    0.00     254/4201415     camlCore__getWord_1135 [91]
                0.00    0.00   20320/4201415     camlCore__oldValue_1252 [66]
                0.27    0.53 4180459/4201415     camlCore__evalArg_1120 [14]
[15]    23.1    0.27    0.54 4201415         camlHashtbl__find_1093 [15]
                0.09    0.27 7347692/14738368     caml_compare [17]
                0.01    0.16 4201415/7040291     caml_hash_univ_param [25]
                0.00    0.00 7347692/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     127/2813812     camlCore__aux_1231 [82]
                0.11    0.68 2813685/2813812     camlCore__applyEq_1259 [9]
[16]    22.6    0.11    0.68 2813812         camlHashtbl__replace_1112 [16]
                0.27    0.26 2813812/2813812     camlHashtbl__replace_bucket_1116 [21]
                0.01    0.11 2813812/7040291     caml_hash_univ_param [25]
                0.03    0.00 2813812/8207956     caml_modify [38]
                0.00    0.00      53/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.01  327511/14738368     camlNetlist_ast__compare_1032 [54]
                0.01    0.02  430346/14738368     camlHashtbl__find_rec_1088 [50]
                0.02    0.05 1445606/14738368     camlList__assoc_1169 [39]
                0.06    0.19 5187213/14738368     camlHashtbl__replace_bucket_1116 [21]
                0.09    0.27 7347692/14738368     camlHashtbl__find_1093 [15]
[17]    20.9    0.18    0.55 14738368         caml_compare [17]
                0.45    0.10 14738368/15088151     compare_val [20]
-----------------------------------------------
                0.00    0.59     216/216         caml_minor_collection [11]
[18]    16.8    0.00    0.59     216         caml_major_collection_slice [18]
                0.37    0.00      89/89          mark_slice [24]
                0.14    0.08     127/127         sweep_slice [27]
                0.00    0.00      44/44          start_cycle [78]
                0.00    0.00    1296/2185        caml_gc_message [203]
                0.00    0.00      43/43          caml_compact_heap_maybe [245]
-----------------------------------------------
                0.03    0.54     432/432         caml_minor_collection [11]
[19]    16.4    0.03    0.54     432         caml_empty_minor_heap [19]
                0.12    0.31     216/216         caml_oldify_mopup [22]
                0.06    0.05 1729417/6480079     caml_oldify_one [23]
                0.00    0.00     216/216         caml_oldify_local_roots [90]
                0.00    0.00     432/2185        caml_gc_message [203]
                0.00    0.00     432/432         clear_table [209]
                0.00    0.00     432/432         caml_final_empty_young [208]
-----------------------------------------------
                0.00    0.00       5/15088151     caml_equal [60]
                0.00    0.00       7/15088151     caml_greaterequal [144]
                0.00    0.00      13/15088151     caml_lessequal [129]
                0.01    0.00  349758/15088151     caml_notequal [49]
                0.45    0.10 14738368/15088151     caml_compare [17]
[20]    16.1    0.46    0.10 15088151         compare_val [20]
                0.10    0.00 23892762/30955528     caml_string_length [36]
-----------------------------------------------
                             2395557             camlHashtbl__replace_bucket_1116 [21]
                0.27    0.26 2813812/2813812     camlHashtbl__replace_1112 [16]
[21]    15.1    0.27    0.26 2813812+2395557 camlHashtbl__replace_bucket_1116 [21]
                0.06    0.19 5187213/14738368     caml_compare [17]
                0.00    0.00 5187288/16628563     caml_debugger_cleanup_fork [176]
                             2395557             camlHashtbl__replace_bucket_1116 [21]
-----------------------------------------------
                0.12    0.31     216/216         caml_empty_minor_heap [19]
[22]    12.3    0.12    0.31     216         caml_oldify_mopup [22]
                0.17    0.14 4749475/6480079     caml_oldify_one [23]
-----------------------------------------------
                0.00    0.00     432/6480079     caml_iterate_global_roots [93]
                0.00    0.00     755/6480079     caml_oldify_local_roots [90]
                0.06    0.05 1729417/6480079     caml_empty_minor_heap [19]
                0.17    0.14 4749475/6480079     caml_oldify_mopup [22]
[23]    12.1    0.23    0.19 6480079         caml_oldify_one [23]
                0.04    0.15 7289983/7289998     caml_alloc_shr [29]
-----------------------------------------------
                0.37    0.00      89/89          caml_major_collection_slice [18]
[24]    10.6    0.37    0.00      89         mark_slice [24]
                0.00    0.00     178/2185        caml_gc_message [203]
                0.00    0.00      44/44          caml_final_update [244]
                0.00    0.00      44/45          caml_fl_init_merge [242]
                0.00    0.00       6/6           realloc_gray_vals [263]
-----------------------------------------------
                0.00    0.00     179/7040291     camlHashtbl__add_1074 [98]
                0.00    0.00   24885/7040291     camlHashtbl__hash_1031 [73]
                0.01    0.11 2813812/7040291     camlHashtbl__replace_1112 [16]
                0.01    0.16 4201415/7040291     camlHashtbl__find_1093 [15]
[25]     8.3    0.02    0.27 7040291         caml_hash_univ_param [25]
                0.24    0.03 7040291/7040291     hash_aux [26]
-----------------------------------------------
                0.24    0.03 7040291/7040291     caml_hash_univ_param [25]
[26]     7.7    0.24    0.03 7040291         hash_aux [26]
                0.03    0.00 7039859/30955528     caml_string_length [36]
-----------------------------------------------
                0.14    0.08     127/127         caml_major_collection_slice [18]
[27]     6.2    0.14    0.08     127         sweep_slice [27]
                0.08    0.00 6994146/6994147     caml_fl_merge_block [40]
                0.00    0.00     127/2185        caml_gc_message [203]
                0.00    0.00       2/2           caml_finalize_channel [291]
-----------------------------------------------
                0.05    0.14  597535/597535      camlCore__evalExp_1171 [10]
[28]     5.5    0.05    0.14  597535         camlArray__sub_1081 [28]
                0.02    0.10  597535/933392      caml_make_vect [31]
                0.02    0.00 2027047/8207956     caml_modify [38]
                0.00    0.00  597535/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       2/7289998     caml_alloc_string [55]
                0.00    0.00       6/7289998     caml_make_vect [31]
                0.00    0.00       7/7289998     caml_alloc_custom [148]
                0.04    0.15 7289983/7289998     caml_oldify_one [23]
[29]     5.5    0.04    0.15 7289998         caml_alloc_shr [29]
                0.09    0.06 7290014/7290014     caml_fl_allocate [34]
                0.00    0.00      16/16          caml_round_heap_chunk_size [253]
                0.00    0.00      16/17          caml_alloc_for_heap [249]
                0.00    0.00      16/16          caml_add_to_heap [251]
                0.00    0.00      16/16          caml_fl_add_blocks [252]
-----------------------------------------------
                0.00    0.19       1/1           camlMain__simulate_1115 [6]
[30]     5.4    0.00    0.19       1         camlNetlist__read_file_1033 [30]
                0.00    0.06   22155/22155       camlNetlist_parser___menhir_run21_1232 [41]
                0.01    0.02   18088/18088       camlNetlist_parser___menhir_run12_1234 [45]
                0.00    0.03   32918/32918       camlNetlist_parser___menhir_run24_1229 [46]
                0.00    0.03   22156/22156       camlNetlist_parser___menhir_run10_1236 [47]
                0.00    0.02   22156/22156       camlNetlist_parser___menhir_goto_ty_exp_1233 [51]
                0.00    0.02       1/1           camlNetlist_parser___menhir_goto_list_equ__1226 [59]
                0.00    0.00    1603/1603        camlNetlist_parser___menhir_run25_1230 [70]
                0.00    0.00       2/2           camlNetlist_parser___menhir_run2_1242 [111]
                0.00    0.00       2/2           camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_NAME___1238 [114]
                0.00    0.00       1/1           camlNetlist_parser__program_1244 [117]
                0.00    0.00       1/1           camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_var___1235 [119]
                0.00    0.00       1/2           camlLexing__from_function_1113 [141]
                0.00    0.00       1/1           camlNetlist__find_file_1031 [167]
                0.00    0.00       1/8207956     caml_modify [38]
                0.00    0.00   34521/34521       camlNetlist_parser___menhir_goto_arg_1225 [183]
                0.00    0.00   22155/22155       camlNetlist_parser___menhir_goto_exp_1227 [188]
                0.00    0.00       2/2           camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_NAME__1239 [288]
                0.00    0.00       1/2           camlLexing__from_channel_1115 [287]
                0.00    0.00       1/1           camlNetlist_parser___menhir_reduce18_1231 [326]
                0.00    0.00       1/1           camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_var__1228 [325]
-----------------------------------------------
                0.00    0.00       1/933392      camlRandom__new_state_1036 [146]
                0.00    0.00       4/933392      camlParsing__entry [123]
                0.00    0.00       6/933392      camlHashtbl__create_1051 [115]
                0.00    0.00       7/933392      camlHashtbl__resize_1061 [71]
                0.00    0.00      51/933392      camlArray__of_list_1130 [97]
                0.00    0.00     254/933392      camlCore__fixSize_1128 [81]
                0.01    0.05  335534/933392      camlArray__append_1054 [37]
                0.02    0.10  597535/933392      camlArray__sub_1081 [28]
[31]     5.1    0.03    0.15  933392         caml_make_vect [31]
                0.01    0.14  933380/933387      caml_alloc_small [35]
                0.00    0.00       6/7289998     caml_alloc_shr [29]
                0.00    0.00   24690/24690       caml_initialize [185]
                0.00    0.00       6/15          caml_check_urgent_gc [254]
-----------------------------------------------
                0.00    0.00       1/175279      camlNetlist_parser__program_1244 [117]
                0.00    0.00       1/175279      camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_var___1235 [119]
                0.00    0.00       2/175279      camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_NAME___1238 [114]
                0.00    0.00       4/175279      camlNetlist_parser___menhir_run2_1242 [111]
                0.00    0.00    1603/175279      camlNetlist_parser___menhir_run25_1230 [70]
                0.00    0.02   22155/175279      camlNetlist_parser___menhir_goto_ty_exp_1233 [51]
                0.00    0.02   22795/175279      camlNetlist_parser___menhir_run12_1234 [45]
                0.00    0.03   30362/175279      camlNetlist_parser___menhir_run10_1236 [47]
                0.00    0.03   32918/175279      camlNetlist_parser___menhir_run24_1229 [46]
                0.00    0.06   65438/175279      camlNetlist_parser___menhir_run21_1232 [41]
[32]     4.7    0.00    0.16  175279         camlNetlist_parser___menhir_discard_1243 [32]
                0.00    0.16  343670/343671      camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
                0.01    0.00  525837/8207956     caml_modify [38]
                0.00    0.00  343670/343671      camlNetlist_lexer__token_1082 [178]
-----------------------------------------------
                0.00    0.00       1/343671      camlNetlist_parser__program_1244 [117]
                0.00    0.16  343670/343671      camlNetlist_parser___menhir_discard_1243 [32]
[33]     4.5    0.00    0.16  343671         camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
                0.02    0.07   98364/98364       camlList__assoc_1169 [39]
                0.02    0.03  345985/347247      camlLexing__engine_1090 [43]
                0.00    0.01  122762/122762      camlLexing__sub_lexeme_1126 [62]
                0.00    0.01   98364/98364       camlLexing__lexeme_1122 [64]
                0.00    0.00   26662/26662       camlLexing__new_line_1155 [74]
                0.00    0.00    2314/2318        camlLexing__lex_refill_1100 [197]
                0.00    0.00    2314/2318        caml_curry3_2 [199]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.09    0.06 7290014/7290014     caml_alloc_shr [29]
[34]     4.3    0.09    0.06 7290014         caml_fl_allocate [34]
                0.06    0.00 7289998/7289998     allocate_block [42]
-----------------------------------------------
                0.00    0.00       1/933387      caml_sys_get_argv [125]
                0.00    0.00       1/933387      caml_sys_get_config [145]
                0.00    0.00       1/933387      caml_obj_dup [150]
                0.00    0.00       2/933387      caml_raise_constant [137]
                0.00    0.00       2/933387      caml_ml_out_channels_list [135]
                0.01    0.14  933380/933387      caml_make_vect [31]
[35]     4.3    0.01    0.14  933387         caml_alloc_small [35]
                0.00    0.14      26/216         caml_minor_collection [11]
-----------------------------------------------
                0.00    0.00       2/30955528     caml_sys_open [175]
                0.00    0.00     110/30955528     parse_format [130]
                0.00    0.00   22795/30955528     parse_intnat [88]
                0.03    0.00 7039859/30955528     hash_aux [26]
                0.10    0.00 23892762/30955528     compare_val [20]
[36]     3.7    0.13    0.00 30955528         caml_string_length [36]
-----------------------------------------------
                0.00    0.00     254/335534      camlCore__fixSize_1128 [81]
                0.02    0.09  335280/335534      camlCore__evalExp_1171 [10]
[37]     3.2    0.02    0.09  335534         camlArray__append_1054 [37]
                0.01    0.05  335534/933392      caml_make_vect [31]
                0.03    0.00 2098167/8207956     caml_modify [38]
                0.00    0.00  335534/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/8207956     camlNetlist__read_file_1033 [30]
                0.00    0.00       1/8207956     camlPervasives__at_exit_1322 [169]
                0.00    0.00       1/8207956     camlArg__treat_action_1154 [168]
                0.00    0.00       2/8207956     camlSim_lexer__read_file_1053 [80]
                0.00    0.00       4/8207956     camlFormat__format_pp_token_1227 [166]
                0.00    0.00       4/8207956     camlFormat__scan_push_1308 [151]
                0.00    0.00       5/8207956     caml_alloc_array [132]
                0.00    0.00       6/8207956     camlFormat__make_formatter_1493 [152]
                0.00    0.00       7/8207956     camlHashtbl__resize_1061 [71]
                0.00    0.00       8/8207956     camlFormat__pp_clear_queue_1196 [158]
                0.00    0.00      20/8207956     camlFormat__pp_rinit_1349 [136]
                0.00    0.00      57/8207956     camlFormat__take_queue_1188 [124]
                0.00    0.00     110/8207956     camlRandom__full_init_1040 [69]
                0.00    0.00     112/8207956     camlFormat__add_queue_1180 [116]
                0.00    0.00     179/8207956     camlHashtbl__add_1074 [98]
                0.00    0.00     254/8207956     camlCore__tic_1245 [8]
                0.00    0.00     255/8207956     camlArray__fill_1135 [113]
                0.00    0.00     306/8207956     camlSim_lexer____ocaml_lex_token_rec_1041 [85]
                0.00    0.00     356/8207956     camlSim_lexer__handleNewline_1037 [96]
                0.00    0.00   24885/8207956     camlHashtbl__insert_bucket_1068 [72]
                0.00    0.00   26662/8207956     camlLexing__new_line_1155 [74]
                0.01    0.00  525837/8207956     camlNetlist_parser___menhir_discard_1243 [32]
                0.01    0.00  689858/8207956     camlLexing__engine_1090 [43]
                0.02    0.00 2027047/8207956     camlArray__sub_1081 [28]
                0.03    0.00 2098167/8207956     camlArray__append_1054 [37]
                0.03    0.00 2813812/8207956     camlHashtbl__replace_1112 [16]
[38]     3.0    0.10    0.00 8207956         caml_modify [38]
                0.00    0.00  825039/873056      caml_darken [65]
                0.00    0.00       1/1           caml_realloc_ref_table [347]
-----------------------------------------------
                0.02    0.07   98364/98364       camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
[39]     2.6    0.02    0.07   98364         camlList__assoc_1169 [39]
                0.02    0.05 1445606/14738368     caml_compare [17]
                0.00    0.00 1445607/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/6994147     caml_make_free_blocks [173]
                0.08    0.00 6994146/6994147     sweep_slice [27]
[40]     2.3    0.08    0.00 6994147         caml_fl_merge_block [40]
-----------------------------------------------
                0.00    0.06   22155/22155       camlNetlist__read_file_1033 [30]
[41]     1.7    0.00    0.06   22155         camlNetlist_parser___menhir_run21_1232 [41]
                0.00    0.06   65438/175279      camlNetlist_parser___menhir_discard_1243 [32]
-----------------------------------------------
                0.06    0.00 7289998/7289998     caml_fl_allocate [34]
[42]     1.7    0.06    0.00 7289998         allocate_block [42]
-----------------------------------------------
                0.00    0.00     549/347247      camlSim_lexer____ocaml_lex_token_rec_1041 [85]
                0.00    0.00     713/347247      camlSim_lexer____ocaml_lex_comment_rec_1043 [84]
                0.02    0.03  345985/347247      camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
[43]     1.4    0.02    0.03  347247         camlLexing__engine_1090 [43]
                0.02    0.00  347247/347247      caml_lex_engine [52]
                0.01    0.00  689858/8207956     caml_modify [38]
                0.00    0.00  347255/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                                                 <spontaneous>
[44]     1.1    0.04    0.00                 caml_c_call [44]
-----------------------------------------------
                0.01    0.02   18088/18088       camlNetlist__read_file_1033 [30]
[45]     0.9    0.01    0.02   18088         camlNetlist_parser___menhir_run12_1234 [45]
                0.00    0.02   22795/175279      camlNetlist_parser___menhir_discard_1243 [32]
                0.00    0.00   22795/22795       caml_int_of_string [87]
                0.00    0.00   22795/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.03   32918/32918       camlNetlist__read_file_1033 [30]
[46]     0.9    0.00    0.03   32918         camlNetlist_parser___menhir_run24_1229 [46]
                0.00    0.03   32918/175279      camlNetlist_parser___menhir_discard_1243 [32]
-----------------------------------------------
                0.00    0.03   22156/22156       camlNetlist__read_file_1033 [30]
[47]     0.8    0.00    0.03   22156         camlNetlist_parser___menhir_run10_1236 [47]
                0.00    0.03   30362/175279      camlNetlist_parser___menhir_discard_1243 [32]
-----------------------------------------------
                0.00    0.02  750062/750062      camlCore__applyEq_1259 [9]
[48]     0.7    0.00    0.02  750062         camlCore__fun_1348 [48]
                0.01    0.01  349758/349758      caml_notequal [49]
                0.00    0.00  349766/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.01    0.01  349758/349758      camlCore__fun_1348 [48]
[49]     0.7    0.01    0.01  349758         caml_notequal [49]
                0.01    0.00  349758/15088151     compare_val [20]
-----------------------------------------------
                0.00    0.00      34/326526      camlCore__oldValue_1252 [66]
                0.00    0.02  326492/326526      camlCore__evalArg_1120 [14]
[50]     0.6    0.00    0.02  326526         camlHashtbl__find_rec_1088 [50]
                0.01    0.02  430346/14738368     caml_compare [17]
                0.00    0.00  430346/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.02   22156/22156       camlNetlist__read_file_1033 [30]
[51]     0.6    0.00    0.02   22156         camlNetlist_parser___menhir_goto_ty_exp_1233 [51]
                0.00    0.02   22155/175279      camlNetlist_parser___menhir_discard_1243 [32]
-----------------------------------------------
                0.02    0.00  347247/347247      camlLexing__engine_1090 [43]
[52]     0.6    0.02    0.00  347247         caml_lex_engine [52]
-----------------------------------------------
                0.02    0.00  750062/750062      camlCore__evalExp_1171 [10]
[53]     0.6    0.02    0.00  750062         camlCore__evalBinop_1123 [53]
                0.00    0.00      14/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00    5798/327511      camlMap__find_1117 [75]
                0.00    0.02  321713/327511      camlMap__add_1108 [57]
[54]     0.5    0.00    0.02  327511         camlNetlist_ast__compare_1032 [54]
                0.00    0.01  327511/14738368     caml_compare [17]
                0.00    0.00  327511/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       2/221650      alloc_inet_addr [155]
                0.00    0.00       2/221650      alloc_inet6_addr [154]
                0.00    0.00     110/221650      caml_md5_string [106]
                0.00    0.00     117/221650      caml_copy_string [101]
                0.00    0.02  221419/221650      caml_create_string [56]
[55]     0.5    0.00    0.02  221650         caml_alloc_string [55]
                0.00    0.02       3/216         caml_minor_collection [11]
                0.00    0.00       2/7289998     caml_alloc_shr [29]
                0.00    0.00       2/15          caml_check_urgent_gc [254]
-----------------------------------------------
                0.00    0.00       1/221419      camlString__make_1038 [162]
                0.00    0.00       2/221419      camlBuffer__create_1039 [153]
                0.00    0.00       4/221419      camlLexing__from_function_1113 [141]
                0.00    0.00      49/221419      camlFormat__pp_print_char_1374 [112]
                0.00    0.00     110/221419      camlPervasives__$5e_1112 [105]
                0.00    0.00     127/221419      camlCore__addInput_1224 [86]
                0.00    0.01   98364/221419      camlLexing__lexeme_1122 [64]
                0.00    0.01  122762/221419      camlLexing__sub_lexeme_1126 [62]
[56]     0.5    0.00    0.02  221419         caml_create_string [56]
                0.00    0.02  221419/221650      caml_alloc_string [55]
-----------------------------------------------
                              321713             camlMap__add_1108 [57]
                0.00    0.02   22156/22156       camlList__fold_left_1078 [58]
[57]     0.5    0.00    0.02   22156+321713  camlMap__add_1108 [57]
                0.00    0.02  321713/327511      camlNetlist_ast__compare_1032 [54]
                0.00    0.00  321713/351992      caml_apply2 [177]
                0.00    0.00  299558/321713      camlMap__bal_1081 [179]
                0.00    0.00   22127/44280       camlMap__create_1071 [182]
                              321713             camlMap__add_1108 [57]
-----------------------------------------------
                0.00    0.02       1/1           camlNetlist_parser___menhir_goto_list_equ__1226 [59]
[58]     0.5    0.00    0.02       1         camlList__fold_left_1078 [58]
                0.00    0.02   22156/22156       camlMap__add_1108 [57]
                0.00    0.00   22156/22156       camlNetlist_ast__fun_1245 [187]
                0.00    0.00   22156/351992      caml_apply2 [177]
                0.00    0.00   22155/321713      camlMap__bal_1081 [179]
                0.00    0.00      13/44280       camlMap__create_1071 [182]
-----------------------------------------------
                0.00    0.02       1/1           camlNetlist__read_file_1033 [30]
[59]     0.5    0.00    0.02       1         camlNetlist_parser___menhir_goto_list_equ__1226 [59]
                0.00    0.02       1/1           camlList__fold_left_1078 [58]
                0.00    0.00       1/1           camlNetlist_ast__of_list_1114 [323]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/5           camlRandom__full_init_1040 [69]
                0.01    0.00       4/5           camlArg__assoc3_1092 [63]
[60]     0.3    0.01    0.00       5         caml_equal [60]
                0.00    0.00       5/15088151     compare_val [20]
-----------------------------------------------
                                                 <spontaneous>
[61]     0.3    0.01    0.00                 compare_stack_overflow [61]
-----------------------------------------------
                0.00    0.01  122762/122762      camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
[62]     0.3    0.00    0.01  122762         camlLexing__sub_lexeme_1126 [62]
                0.00    0.01  122762/221419      caml_create_string [56]
                0.00    0.00  122762/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00  122762/225631      caml_blit_string [180]
-----------------------------------------------
                0.00    0.01       2/2           camlArg__parse_argv_1132 [5]
[63]     0.2    0.00    0.01       2         camlArg__assoc3_1092 [63]
                0.01    0.00       4/5           caml_equal [60]
                0.00    0.00       4/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.01   98364/98364       camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
[64]     0.2    0.00    0.01   98364         camlLexing__lexeme_1122 [64]
                0.00    0.01   98364/221419      caml_create_string [56]
                0.00    0.00   98364/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00   98364/225631      caml_blit_string [180]
-----------------------------------------------
                0.00    0.00      88/873056      caml_iterate_global_roots [93]
                0.00    0.00     673/873056      caml_do_local_roots [110]
                0.00    0.00   47256/873056      caml_do_roots [77]
                0.00    0.00  825039/873056      caml_modify [38]
[65]     0.1    0.01    0.00  873056         caml_darken [65]
-----------------------------------------------
                0.00    0.00   20320/20320       camlCore__applyEq_1259 [9]
[66]     0.1    0.00    0.00   20320         camlCore__oldValue_1252 [66]
                0.00    0.00   20320/4201415     camlHashtbl__find_1093 [15]
                0.00    0.00      34/326526      camlHashtbl__find_rec_1088 [50]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[67]     0.1    0.00    0.00       1         camlFilename__entry [67]
                0.00    0.00       1/1           camlRandom__make_self_init_1058 [68]
                0.00    0.00       2/2           caml_sys_getenv [139]
                0.00    0.00       7/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       2/4           caml_curry3_1 [268]
                0.00    0.00       2/351992      caml_apply2 [177]
                0.00    0.00       2/54          caml_curry4_2 [232]
                0.00    0.00       2/54          caml_apply3 [230]
                0.00    0.00       2/2248        caml_string_notequal [202]
                0.00    0.00       1/53          caml_curry2 [233]
-----------------------------------------------
                0.00    0.00       1/1           camlFilename__entry [67]
[68]     0.1    0.00    0.00       1         camlRandom__make_self_init_1058 [68]
                0.00    0.00       1/1           camlRandom__full_init_1040 [69]
                0.00    0.00       1/1           camlRandom__new_state_1036 [146]
                0.00    0.00       1/1           caml_sys_random_seed [351]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           camlRandom__make_self_init_1058 [68]
[69]     0.1    0.00    0.00       1         camlRandom__full_init_1040 [69]
                0.00    0.00       1/5           caml_equal [60]
                0.00    0.00     110/110         camlPervasives__string_of_int_1130 [102]
                0.00    0.00     110/110         camlPervasives__$5e_1112 [105]
                0.00    0.00     110/110         camlDigest__string_1033 [104]
                0.00    0.00     110/8207956     caml_modify [38]
                0.00    0.00       1/7           camlPervasives__max_1025 [143]
                0.00    0.00     110/110         camlRandom__extract_1046 [222]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00    1603/1603        camlNetlist__read_file_1033 [30]
[70]     0.0    0.00    0.00    1603         camlNetlist_parser___menhir_run25_1230 [70]
                0.00    0.00    1603/175279      camlNetlist_parser___menhir_discard_1243 [32]
                0.00    0.00    1603/1603        camlNetlist_parser__value_of_const_1221 [205]
-----------------------------------------------
                0.00    0.00       7/7           camlCore__applyEq_1259 [9]
[71]     0.0    0.00    0.00       7         camlHashtbl__resize_1061 [71]
                0.00    0.00   12439/12439       camlHashtbl__insert_bucket_1068 [72]
                0.00    0.00       7/933392      caml_make_vect [31]
                0.00    0.00       7/13          camlPervasives__min_1022 [128]
                0.00    0.00       7/8207956     caml_modify [38]
                0.00    0.00       7/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                               24885             camlHashtbl__insert_bucket_1068 [72]
                0.00    0.00   12439/12439       camlHashtbl__resize_1061 [71]
[72]     0.0    0.00    0.00   12439+24885   camlHashtbl__insert_bucket_1068 [72]
                0.00    0.00   24885/24885       camlHashtbl__hash_1031 [73]
                0.00    0.00   24885/8207956     caml_modify [38]
                               24885             camlHashtbl__insert_bucket_1068 [72]
-----------------------------------------------
                0.00    0.00   24885/24885       camlHashtbl__insert_bucket_1068 [72]
[73]     0.0    0.00    0.00   24885         camlHashtbl__hash_1031 [73]
                0.00    0.00   24885/7040291     caml_hash_univ_param [25]
-----------------------------------------------
                0.00    0.00   26662/26662       camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
[74]     0.0    0.00    0.00   26662         camlLexing__new_line_1155 [74]
                0.00    0.00   26662/8207956     caml_modify [38]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     127/414         camlCore__aux_1231 [82]
                0.00    0.00     127/414         camlCore__var_list_length_1219 [89]
                0.00    0.00     160/414         camlCore__evalDefault_1249 [83]
[75]     0.0    0.00    0.00     414         camlMap__find_1117 [75]
                0.00    0.00    5798/327511      camlNetlist_ast__compare_1032 [54]
                0.00    0.00    5798/351992      caml_apply2 [177]
-----------------------------------------------
                0.00    0.00      44/44          start_cycle [78]
[76]     0.0    0.00    0.00      44         caml_darken_all_roots [76]
                0.00    0.00      44/44          caml_do_roots [77]
-----------------------------------------------
                0.00    0.00      44/44          caml_darken_all_roots [76]
[77]     0.0    0.00    0.00      44         caml_do_roots [77]
                0.00    0.00   47256/873056      caml_darken [65]
                0.00    0.00      44/44          caml_scan_global_roots [107]
                0.00    0.00      44/44          caml_do_local_roots [110]
                0.00    0.00      44/44          caml_final_do_strong_roots [243]
-----------------------------------------------
                0.00    0.00      44/44          caml_major_collection_slice [18]
[78]     0.0    0.00    0.00      44         start_cycle [78]
                0.00    0.00      44/44          caml_darken_all_roots [76]
                0.00    0.00      44/2185        caml_gc_message [203]
-----------------------------------------------
                0.00    0.00       1/1           camlMain__simulate_1115 [6]
[79]     0.0    0.00    0.00       1         camlMain__loadRom_1111 [79]
                0.00    0.00       1/1           camlSim_lexer__read_file_1053 [80]
                0.00    0.00       1/255         camlList__iter_1074 [99]
                0.00    0.00       1/179         camlList__rev_append_1051 [216]
-----------------------------------------------
                0.00    0.00       1/1           camlMain__loadRom_1111 [79]
[80]     0.0    0.00    0.00       1         camlSim_lexer__read_file_1053 [80]
                0.00    0.00     712/712         camlSim_lexer____ocaml_lex_comment_rec_1043 [84]
                0.00    0.00     546/546         camlSim_lexer____ocaml_lex_token_rec_1041 [85]
                0.00    0.00       1/2           camlLexing__from_function_1113 [141]
                0.00    0.00       1/2           camlPervasives__open_in_gen_1214 [163]
                0.00    0.00       2/8207956     caml_modify [38]
                0.00    0.00     712/712         camlSim_lexer__comment_1042 [206]
                0.00    0.00     546/546         camlSim_lexer__token_1040 [207]
                0.00    0.00       1/2           camlPervasives__open_in_1218 [289]
                0.00    0.00       1/2           camlLexing__from_channel_1115 [287]
-----------------------------------------------
                0.00    0.00     254/254         camlCore__applyEq_1259 [9]
[81]     0.0    0.00    0.00     254         camlCore__fixSize_1128 [81]
                0.00    0.00     254/335534      camlArray__append_1054 [37]
                0.00    0.00     254/933392      caml_make_vect [31]
                0.00    0.00     254/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     127/127         camlCore__tic_1245 [8]
[82]     0.0    0.00    0.00     127         camlCore__aux_1231 [82]
                0.00    0.00     127/414         camlMap__find_1117 [75]
                0.00    0.00     127/2813812     camlHashtbl__replace_1112 [16]
                0.00    0.00     127/127         camlCore__fun_1374 [219]
-----------------------------------------------
                0.00    0.00     160/160         camlCore__applyEq_1259 [9]
[83]     0.0    0.00    0.00     160         camlCore__evalDefault_1249 [83]
                0.00    0.00     160/414         camlMap__find_1117 [75]
-----------------------------------------------
                0.00    0.00     712/712         camlSim_lexer__read_file_1053 [80]
[84]     0.0    0.00    0.00     712         camlSim_lexer____ocaml_lex_comment_rec_1043 [84]
                0.00    0.00     713/347247      camlLexing__engine_1090 [43]
                0.00    0.00       1/2318        camlLexing__lex_refill_1100 [197]
                0.00    0.00       1/2318        caml_curry3_2 [199]
-----------------------------------------------
                0.00    0.00     546/546         camlSim_lexer__read_file_1053 [80]
[85]     0.0    0.00    0.00     546         camlSim_lexer____ocaml_lex_token_rec_1041 [85]
                0.00    0.00     549/347247      camlLexing__engine_1090 [43]
                0.00    0.00     178/178         camlSim_lexer__handleNewline_1037 [96]
                0.00    0.00     306/8207956     caml_modify [38]
                0.00    0.00       3/2318        camlLexing__lex_refill_1100 [197]
                0.00    0.00       3/2318        caml_curry3_2 [199]
-----------------------------------------------
                0.00    0.00     127/127         camlCore__tic_1245 [8]
[86]     0.0    0.00    0.00     127         camlCore__addInput_1224 [86]
                0.00    0.00     127/127         camlCore__var_list_length_1219 [89]
                0.00    0.00     127/221419      caml_create_string [56]
                0.00    0.00     127/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00   22795/22795       camlNetlist_parser___menhir_run12_1234 [45]
[87]     0.0    0.00    0.00   22795         caml_int_of_string [87]
                0.00    0.00   22795/22795       parse_intnat [88]
-----------------------------------------------
                0.00    0.00   22795/22795       caml_int_of_string [87]
[88]     0.0    0.00    0.00   22795         parse_intnat [88]
                0.00    0.00   22795/30955528     caml_string_length [36]
                0.00    0.00   46250/46250       parse_digit [181]
                0.00    0.00   22795/22795       parse_sign_and_base [186]
-----------------------------------------------
                                 127             camlCore__var_list_length_1219 [89]
                0.00    0.00     127/127         camlCore__addInput_1224 [86]
[89]     0.0    0.00    0.00     127+127     camlCore__var_list_length_1219 [89]
                0.00    0.00     127/414         camlMap__find_1117 [75]
                                 127             camlCore__var_list_length_1219 [89]
-----------------------------------------------
                0.00    0.00     216/216         caml_empty_minor_heap [19]
[90]     0.0    0.00    0.00     216         caml_oldify_local_roots [90]
                0.00    0.00     755/6480079     caml_oldify_one [23]
                0.00    0.00     216/216         caml_scan_global_young_roots [95]
                0.00    0.00     216/216         caml_final_do_young_roots [215]
                0.00    0.00       1/1           caml_init_frame_descriptors [343]
-----------------------------------------------
                0.00    0.00     254/254         camlCore__applyEq_1259 [9]
[91]     0.0    0.00    0.00     254         camlCore__getWord_1135 [91]
                0.00    0.00     254/4201415     camlHashtbl__find_1093 [15]
-----------------------------------------------
                                 254             camlCore__getOutput_1265 [92]
                0.00    0.00     127/127         camlMain__run_1133 [7]
[92]     0.0    0.00    0.00     127+254     camlCore__getOutput_1265 [92]
                0.00    0.00     254/4201415     camlHashtbl__find_1093 [15]
                                 254             camlCore__getOutput_1265 [92]
-----------------------------------------------
                0.00    0.00     132/564         caml_scan_global_roots [107]
                0.00    0.00     432/564         caml_scan_global_young_roots [95]
[93]     0.0    0.00    0.00     564         caml_iterate_global_roots [93]
                0.00    0.00     432/6480079     caml_oldify_one [23]
                0.00    0.00      88/873056      caml_darken [65]
-----------------------------------------------
                0.00    0.00     127/127         camlCore__evalExp_1171 [10]
[94]     0.0    0.00    0.00     127         camlCore__getRamTable_1168 [94]
                0.00    0.00     128/4201415     camlHashtbl__find_1093 [15]
                0.00    0.00       1/6           camlHashtbl__create_1051 [115]
                0.00    0.00       1/179         camlHashtbl__add_1074 [98]
-----------------------------------------------
                0.00    0.00     216/216         caml_oldify_local_roots [90]
[95]     0.0    0.00    0.00     216         caml_scan_global_young_roots [95]
                0.00    0.00     432/564         caml_iterate_global_roots [93]
-----------------------------------------------
                0.00    0.00     178/178         camlSim_lexer____ocaml_lex_token_rec_1041 [85]
[96]     0.0    0.00    0.00     178         camlSim_lexer__handleNewline_1037 [96]
                0.00    0.00     178/178         camlArray__of_list_1130 [97]
                0.00    0.00     356/8207956     caml_modify [38]
                0.00    0.00      51/51          camlArray__fill_1135 [113]
                0.00    0.00     178/179         camlList__rev_append_1051 [216]
-----------------------------------------------
                0.00    0.00     178/178         camlSim_lexer__handleNewline_1037 [96]
[97]     0.0    0.00    0.00     178         camlArray__of_list_1130 [97]
                0.00    0.00      51/933392      caml_make_vect [31]
                0.00    0.00      51/51          camlArray__list_length_1126 [238]
                0.00    0.00      51/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/179         camlCore__getRamTable_1168 [94]
                0.00    0.00     178/179         camlMain__fun_1160 [100]
[98]     0.0    0.00    0.00     179         camlHashtbl__add_1074 [98]
                0.00    0.00     179/7040291     caml_hash_univ_param [25]
                0.00    0.00     179/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       1/255         camlMain__loadRom_1111 [79]
                0.00    0.00     127/255         camlMain__check_power_1126 [109]
                0.00    0.00     127/255         camlCore__tic_1245 [8]
[99]     0.0    0.00    0.00     255         camlList__iter_1074 [99]
                0.00    0.00     178/178         camlMain__fun_1160 [100]
                0.00    0.00     254/254         camlMain__fun_1166 [213]
                0.00    0.00     127/127         camlArray__iter_1101 [217]
                0.00    0.00     127/12573       camlMain__aux_1122 [193]
-----------------------------------------------
                0.00    0.00     178/178         camlList__iter_1074 [99]
[100]    0.0    0.00    0.00     178         camlMain__fun_1160 [100]
                0.00    0.00     178/179         camlHashtbl__add_1074 [98]
-----------------------------------------------
                0.00    0.00       1/117         caml_sys_get_argv [125]
                0.00    0.00       1/117         caml_sys_get_config [145]
                0.00    0.00       5/117         caml_alloc_array [132]
                0.00    0.00     110/117         caml_format_int [103]
[101]    0.0    0.00    0.00     117         caml_copy_string [101]
                0.00    0.00     117/221650      caml_alloc_string [55]
-----------------------------------------------
                0.00    0.00     110/110         camlRandom__full_init_1040 [69]
[102]    0.0    0.00    0.00     110         camlPervasives__string_of_int_1130 [102]
                0.00    0.00     110/110         caml_format_int [103]
                0.00    0.00     110/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     110/110         camlPervasives__string_of_int_1130 [102]
[103]    0.0    0.00    0.00     110         caml_format_int [103]
                0.00    0.00     110/117         caml_copy_string [101]
                0.00    0.00     110/110         parse_format [130]
-----------------------------------------------
                0.00    0.00     110/110         camlRandom__full_init_1040 [69]
[104]    0.0    0.00    0.00     110         camlDigest__string_1033 [104]
                0.00    0.00     110/110         caml_md5_string [106]
                0.00    0.00     110/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     110/110         camlRandom__full_init_1040 [69]
[105]    0.0    0.00    0.00     110         camlPervasives__$5e_1112 [105]
                0.00    0.00     110/221419      caml_create_string [56]
                0.00    0.00     220/225631      caml_blit_string [180]
                0.00    0.00     110/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     110/110         camlDigest__string_1033 [104]
[106]    0.0    0.00    0.00     110         caml_md5_string [106]
                0.00    0.00     110/221650      caml_alloc_string [55]
                0.00    0.00     110/110         caml_MD5Init [224]
                0.00    0.00     110/110         caml_MD5Update [226]
                0.00    0.00     110/110         caml_MD5Final [223]
-----------------------------------------------
                0.00    0.00      44/44          caml_do_roots [77]
[107]    0.0    0.00    0.00      44         caml_scan_global_roots [107]
                0.00    0.00     132/564         caml_iterate_global_roots [93]
-----------------------------------------------
                0.00    0.00       3/3           camlMain__simulate_1115 [6]
[108]    0.0    0.00    0.00       3         camlFormat__doprn_1625 [108]
                0.00    0.00      49/49          camlFormat__pp_print_char_1374 [112]
                0.00    0.00      49/49          camlFormat__enqueue_advance_1279 [118]
                0.00    0.00      49/53          camlFormat__advance_left_1277 [121]
                0.00    0.00       3/3           camlFormat__pp_print_newline_1392 [131]
                0.00    0.00      49/49          camlFormat__enqueue_string_as_1286 [239]
                0.00    0.00      49/49          camlFormat__pp_print_as_char_1619 [241]
                0.00    0.00       3/4           camlFormat__fun_2097 [266]
-----------------------------------------------
                0.00    0.00     127/127         camlMain__run_1133 [7]
[109]    0.0    0.00    0.00     127         camlMain__check_power_1126 [109]
                0.00    0.00     127/255         camlList__iter_1074 [99]
                0.00    0.00     127/127         camlMain__output_1120 [221]
-----------------------------------------------
                0.00    0.00      44/44          caml_do_roots [77]
[110]    0.0    0.00    0.00      44         caml_do_local_roots [110]
                0.00    0.00     673/873056      caml_darken [65]
-----------------------------------------------
                0.00    0.00       2/2           camlNetlist__read_file_1033 [30]
[111]    0.0    0.00    0.00       2         camlNetlist_parser___menhir_run2_1242 [111]
                0.00    0.00       4/175279      camlNetlist_parser___menhir_discard_1243 [32]
-----------------------------------------------
                0.00    0.00      49/49          camlFormat__doprn_1625 [108]
[112]    0.0    0.00    0.00      49         camlFormat__pp_print_char_1374 [112]
                0.00    0.00      49/221419      caml_create_string [56]
                0.00    0.00      49/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00      51/51          camlSim_lexer__handleNewline_1037 [96]
[113]    0.0    0.00    0.00      51         camlArray__fill_1135 [113]
                0.00    0.00     255/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       2/2           camlNetlist__read_file_1033 [30]
[114]    0.0    0.00    0.00       2         camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_NAME___1238 [114]
                0.00    0.00       2/175279      camlNetlist_parser___menhir_discard_1243 [32]
-----------------------------------------------
                0.00    0.00       1/6           camlCore__getRamTable_1168 [94]
                0.00    0.00       1/6           camlUnix__entry [142]
                0.00    0.00       2/6           camlMain__entry [3]
                0.00    0.00       2/6           camlCore__entry [126]
[115]    0.0    0.00    0.00       6         camlHashtbl__create_1051 [115]
                0.00    0.00       6/933392      caml_make_vect [31]
                0.00    0.00       6/13          camlPervasives__min_1022 [128]
                0.00    0.00       6/7           camlPervasives__max_1025 [143]
                0.00    0.00       6/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       3/56          camlFormat__pp_make_formatter_1485 [161]
                0.00    0.00       4/56          camlFormat__scan_push_1308 [151]
                0.00    0.00      49/56          camlFormat__enqueue_advance_1279 [118]
[116]    0.0    0.00    0.00      56         camlFormat__add_queue_1180 [116]
                0.00    0.00     112/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       1/1           camlNetlist__read_file_1033 [30]
[117]    0.0    0.00    0.00       1         camlNetlist_parser__program_1244 [117]
                0.00    0.00       1/175279      camlNetlist_parser___menhir_discard_1243 [32]
                0.00    0.00       1/343671      camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
                0.00    0.00       1/343671      camlNetlist_lexer__token_1082 [178]
-----------------------------------------------
                0.00    0.00      49/49          camlFormat__doprn_1625 [108]
[118]    0.0    0.00    0.00      49         camlFormat__enqueue_advance_1279 [118]
                0.00    0.00      49/56          camlFormat__add_queue_1180 [116]
-----------------------------------------------
                0.00    0.00       1/1           camlNetlist__read_file_1033 [30]
[119]    0.0    0.00    0.00       1         camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_var___1235 [119]
                0.00    0.00       1/175279      camlNetlist_parser___menhir_discard_1243 [32]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[120]    0.0    0.00    0.00       1         camlSys__entry [120]
                0.00    0.00       1/1           caml_sys_get_argv [125]
                0.00    0.00       1/1           caml_sys_get_config [145]
                0.00    0.00       3/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       4/53          camlFormat__pp_flush_queue_1351 [164]
                0.00    0.00      49/53          camlFormat__doprn_1625 [108]
[121]    0.0    0.00    0.00      53         camlFormat__advance_left_1277 [121]
                0.00    0.00      53/53          camlFormat__advance_loop_1271 [122]
-----------------------------------------------
                0.00    0.00      53/53          camlFormat__advance_left_1277 [121]
[122]    0.0    0.00    0.00      53         camlFormat__advance_loop_1271 [122]
                0.00    0.00      53/53          camlFormat__take_queue_1188 [124]
                0.00    0.00      53/53          camlFormat__format_pp_token_1227 [166]
                0.00    0.00     106/106         camlFormat__peek_queue_1186 [227]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[123]    0.0    0.00    0.00       1         camlParsing__entry [123]
                0.00    0.00       4/933392      caml_make_vect [31]
                0.00    0.00       6/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00      53/53          camlFormat__advance_loop_1271 [122]
[124]    0.0    0.00    0.00      53         camlFormat__take_queue_1188 [124]
                0.00    0.00      57/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       1/1           camlSys__entry [120]
[125]    0.0    0.00    0.00       1         caml_sys_get_argv [125]
                0.00    0.00       1/1           caml_copy_string_array [133]
                0.00    0.00       1/933387      caml_alloc_small [35]
                0.00    0.00       1/117         caml_copy_string [101]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[126]    0.0    0.00    0.00       1         camlCore__entry [126]
                0.00    0.00       2/6           camlHashtbl__create_1051 [115]
                0.00    0.00       7/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           camlArg__parse_argv_1132 [5]
[127]    0.0    0.00    0.00       1         camlPervasives__exit_1326 [127]
                0.00    0.00       1/1           camlPervasives__flush_all_1185 [134]
                0.00    0.00       1/1           camlPervasives__fun_1500 [157]
                0.00    0.00       1/1           camlPervasives__iter_1186 [330]
                0.00    0.00       1/1           caml_sys_exit [349]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       6/13          camlHashtbl__create_1051 [115]
                0.00    0.00       7/13          camlHashtbl__resize_1061 [71]
[128]    0.0    0.00    0.00      13         camlPervasives__min_1022 [128]
                0.00    0.00      13/13          caml_lessequal [129]
                0.00    0.00      13/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00      13/13          camlPervasives__min_1022 [128]
[129]    0.0    0.00    0.00      13         caml_lessequal [129]
                0.00    0.00      13/15088151     compare_val [20]
-----------------------------------------------
                0.00    0.00     110/110         caml_format_int [103]
[130]    0.0    0.00    0.00     110         parse_format [130]
                0.00    0.00     110/30955528     caml_string_length [36]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__doprn_1625 [108]
[131]    0.0    0.00    0.00       3         camlFormat__pp_print_newline_1392 [131]
                0.00    0.00       3/4           camlFormat__pp_rinit_1349 [136]
                0.00    0.00       3/4           camlFormat__scan_push_1308 [151]
                0.00    0.00       3/4           camlFormat__pp_flush_queue_1351 [164]
                0.00    0.00       3/4           camlFormat__pp_open_box_gen_1312 [267]
-----------------------------------------------
                0.00    0.00       1/1           caml_copy_string_array [133]
[132]    0.0    0.00    0.00       1         caml_alloc_array [132]
                0.00    0.00       5/117         caml_copy_string [101]
                0.00    0.00       5/8207956     caml_modify [38]
                0.00    0.00       1/1           caml_alloc [336]
-----------------------------------------------
                0.00    0.00       1/1           caml_sys_get_argv [125]
[133]    0.0    0.00    0.00       1         caml_copy_string_array [133]
                0.00    0.00       1/1           caml_alloc_array [132]
-----------------------------------------------
                0.00    0.00       1/1           camlPervasives__exit_1326 [127]
[134]    0.0    0.00    0.00       1         camlPervasives__flush_all_1185 [134]
                0.00    0.00       1/1           caml_ml_out_channels_list [135]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           camlPervasives__flush_all_1185 [134]
[135]    0.0    0.00    0.00       1         caml_ml_out_channels_list [135]
                0.00    0.00       2/933387      caml_alloc_small [35]
                0.00    0.00       2/7           caml_alloc_channel [147]
-----------------------------------------------
                0.00    0.00       1/4           camlFormat__pp_print_flush_1393 [156]
                0.00    0.00       3/4           camlFormat__pp_print_newline_1392 [131]
[136]    0.0    0.00    0.00       4         camlFormat__pp_rinit_1349 [136]
                0.00    0.00      20/8207956     caml_modify [38]
                0.00    0.00       4/4           camlFormat__pp_clear_queue_1196 [158]
-----------------------------------------------
                0.00    0.00       2/2           caml_raise_not_found [138]
[137]    0.0    0.00    0.00       2         caml_raise_constant [137]
                0.00    0.00       2/933387      caml_alloc_small [35]
                0.00    0.00       2/2           caml_raise [294]
-----------------------------------------------
                0.00    0.00       2/2           caml_sys_getenv [139]
[138]    0.0    0.00    0.00       2         caml_raise_not_found [138]
                0.00    0.00       2/2           caml_raise_constant [137]
-----------------------------------------------
                0.00    0.00       2/2           camlFilename__entry [67]
[139]    0.0    0.00    0.00       2         caml_sys_getenv [139]
                0.00    0.00       2/2           caml_raise_not_found [138]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[140]    0.0    0.00    0.00       1         camlFormat__entry [140]
                0.00    0.00       3/3           camlFormat__make_formatter_1493 [152]
                0.00    0.00       1/1           camlString__make_1038 [162]
                0.00    0.00       1/2           camlBuffer__create_1039 [153]
                0.00    0.00       1/1           camlPervasives__at_exit_1322 [169]
                0.00    0.00      42/53          caml_curry2 [233]
                0.00    0.00       4/8           caml_curry3 [256]
                0.00    0.00       2/2           camlFormat__formatter_of_out_channel_1497 [286]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       1/1           camlFormat__formatter_of_buffer_1499 [309]
                0.00    0.00       1/1           caml_curry5 [338]
-----------------------------------------------
                0.00    0.00       1/2           camlSim_lexer__read_file_1053 [80]
                0.00    0.00       1/2           camlNetlist__read_file_1033 [30]
[141]    0.0    0.00    0.00       2         camlLexing__from_function_1113 [141]
                0.00    0.00       4/221419      caml_create_string [56]
                0.00    0.00       4/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       2/4           caml_curry3_1 [268]
                0.00    0.00       2/351992      caml_apply2 [177]
-----------------------------------------------
                                                 <spontaneous>
[142]    0.0    0.00    0.00                 camlUnix__entry [142]
                0.00    0.00       1/6           camlHashtbl__create_1051 [115]
                0.00    0.00       7/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       1/1           camlCallback__register_exception_1034 [305]
-----------------------------------------------
                0.00    0.00       1/7           camlRandom__full_init_1040 [69]
                0.00    0.00       6/7           camlHashtbl__create_1051 [115]
[143]    0.0    0.00    0.00       7         camlPervasives__max_1025 [143]
                0.00    0.00       7/7           caml_greaterequal [144]
                0.00    0.00       7/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       7/7           camlPervasives__max_1025 [143]
[144]    0.0    0.00    0.00       7         caml_greaterequal [144]
                0.00    0.00       7/15088151     compare_val [20]
-----------------------------------------------
                0.00    0.00       1/1           camlSys__entry [120]
[145]    0.0    0.00    0.00       1         caml_sys_get_config [145]
                0.00    0.00       1/933387      caml_alloc_small [35]
                0.00    0.00       1/117         caml_copy_string [101]
-----------------------------------------------
                0.00    0.00       1/1           camlRandom__make_self_init_1058 [68]
[146]    0.0    0.00    0.00       1         camlRandom__new_state_1036 [146]
                0.00    0.00       1/933392      caml_make_vect [31]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       2/7           caml_ml_open_descriptor_out [165]
                0.00    0.00       2/7           caml_ml_out_channels_list [135]
                0.00    0.00       3/7           caml_ml_open_descriptor_in [159]
[147]    0.0    0.00    0.00       7         caml_alloc_channel [147]
                0.00    0.00       7/7           caml_alloc_custom [148]
-----------------------------------------------
                0.00    0.00       7/7           caml_alloc_channel [147]
[148]    0.0    0.00    0.00       7         caml_alloc_custom [148]
                0.00    0.00       7/7289998     caml_alloc_shr [29]
                0.00    0.00       7/7           caml_adjust_gc_speed [257]
                0.00    0.00       7/15          caml_check_urgent_gc [254]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[149]    0.0    0.00    0.00       1         camlRandom__entry [149]
                0.00    0.00       1/1           caml_obj_dup [150]
                0.00    0.00       5/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           camlRandom__entry [149]
[150]    0.0    0.00    0.00       1         caml_obj_dup [150]
                0.00    0.00       1/933387      caml_alloc_small [35]
-----------------------------------------------
                0.00    0.00       1/4           camlFormat__pp_print_flush_1393 [156]
                0.00    0.00       3/4           camlFormat__pp_print_newline_1392 [131]
[151]    0.0    0.00    0.00       4         camlFormat__scan_push_1308 [151]
                0.00    0.00       4/56          camlFormat__add_queue_1180 [116]
                0.00    0.00       4/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__entry [140]
[152]    0.0    0.00    0.00       3         camlFormat__make_formatter_1493 [152]
                0.00    0.00       6/8207956     caml_modify [38]
                0.00    0.00       3/3           camlFormat__pp_make_formatter_1485 [161]
                0.00    0.00       6/53          caml_curry2 [233]
-----------------------------------------------
                0.00    0.00       1/2           camlFormat__entry [140]
                0.00    0.00       1/2           camlArg__parse_argv_1132 [5]
[153]    0.0    0.00    0.00       2         camlBuffer__create_1039 [153]
                0.00    0.00       2/221419      caml_create_string [56]
                0.00    0.00       2/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                                                 <spontaneous>
[154]    0.0    0.00    0.00                 alloc_inet6_addr [154]
                0.00    0.00       2/221650      caml_alloc_string [55]
-----------------------------------------------
                                                 <spontaneous>
[155]    0.0    0.00    0.00                 alloc_inet_addr [155]
                0.00    0.00       2/221650      caml_alloc_string [55]
-----------------------------------------------
                0.00    0.00       1/1           camlPervasives__fun_1500 [157]
[156]    0.0    0.00    0.00       1         camlFormat__pp_print_flush_1393 [156]
                0.00    0.00       1/4           camlFormat__pp_rinit_1349 [136]
                0.00    0.00       1/4           camlFormat__scan_push_1308 [151]
                0.00    0.00       1/4           camlFormat__pp_flush_queue_1351 [164]
                0.00    0.00       1/4           camlFormat__pp_open_box_gen_1312 [267]
-----------------------------------------------
                0.00    0.00       1/1           camlPervasives__exit_1326 [127]
[157]    0.0    0.00    0.00       1         camlPervasives__fun_1500 [157]
                0.00    0.00       1/1           camlFormat__pp_print_flush_1393 [156]
                0.00    0.00       1/4           camlFormat__fun_2097 [266]
                0.00    0.00       1/7           caml_curry2_1 [258]
-----------------------------------------------
                0.00    0.00       4/4           camlFormat__pp_rinit_1349 [136]
[158]    0.0    0.00    0.00       4         camlFormat__pp_clear_queue_1196 [158]
                0.00    0.00       8/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       1/3           camlPervasives__entry [160]
                0.00    0.00       2/3           camlPervasives__open_in_gen_1214 [163]
[159]    0.0    0.00    0.00       3         caml_ml_open_descriptor_in [159]
                0.00    0.00       3/7           caml_alloc_channel [147]
                0.00    0.00       3/5           caml_open_descriptor_in [265]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[160]    0.0    0.00    0.00       1         camlPervasives__entry [160]
                0.00    0.00       2/2           caml_ml_open_descriptor_out [165]
                0.00    0.00       1/3           caml_ml_open_descriptor_in [159]
                0.00    0.00      12/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       6/6           caml_int64_float_of_bits [261]
                0.00    0.00       1/2           caml_register_named_value [296]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__make_formatter_1493 [152]
[161]    0.0    0.00    0.00       3         camlFormat__pp_make_formatter_1485 [161]
                0.00    0.00       3/56          camlFormat__add_queue_1180 [116]
-----------------------------------------------
                0.00    0.00       1/1           camlFormat__entry [140]
[162]    0.0    0.00    0.00       1         camlString__make_1038 [162]
                0.00    0.00       1/221419      caml_create_string [56]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       1/1           caml_fill_string [341]
-----------------------------------------------
                0.00    0.00       1/2           camlSim_lexer__read_file_1053 [80]
                0.00    0.00       1/2           camlNetlist__find_file_1031 [167]
[163]    0.0    0.00    0.00       2         camlPervasives__open_in_gen_1214 [163]
                0.00    0.00       2/3           caml_ml_open_descriptor_in [159]
                0.00    0.00       2/2           caml_sys_open [175]
                0.00    0.00       4/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/4           camlFormat__pp_print_flush_1393 [156]
                0.00    0.00       3/4           camlFormat__pp_print_newline_1392 [131]
[164]    0.0    0.00    0.00       4         camlFormat__pp_flush_queue_1351 [164]
                0.00    0.00       4/53          camlFormat__advance_left_1277 [121]
                0.00    0.00       3/52          camlPervasives__output_1194 [234]
                0.00    0.00       3/52          caml_curry4_3 [235]
                0.00    0.00       3/54          caml_apply3 [230]
                0.00    0.00       3/3           camlFormat__display_newline_1469 [270]
                0.00    0.00       3/7           caml_curry2_1 [258]
-----------------------------------------------
                0.00    0.00       2/2           camlPervasives__entry [160]
[165]    0.0    0.00    0.00       2         caml_ml_open_descriptor_out [165]
                0.00    0.00       2/7           caml_alloc_channel [147]
                0.00    0.00       2/2           caml_open_descriptor_out [293]
-----------------------------------------------
                0.00    0.00      53/53          camlFormat__advance_loop_1271 [122]
[166]    0.0    0.00    0.00      53         camlFormat__format_pp_token_1227 [166]
                0.00    0.00       4/8207956     caml_modify [38]
                0.00    0.00      49/52          camlPervasives__output_1194 [234]
                0.00    0.00      49/52          caml_curry4_3 [235]
                0.00    0.00      49/54          caml_apply3 [230]
                0.00    0.00      49/49          camlFormat__pp_output_string_1199 [240]
-----------------------------------------------
                0.00    0.00       1/1           camlNetlist__read_file_1033 [30]
[167]    0.0    0.00    0.00       1         camlNetlist__find_file_1031 [167]
                0.00    0.00       1/2           camlPervasives__open_in_gen_1214 [163]
                0.00    0.00       1/2           camlPervasives__open_in_1218 [289]
-----------------------------------------------
                0.00    0.00       2/2           camlArg__parse_argv_1132 [5]
[168]    0.0    0.00    0.00       2         camlArg__treat_action_1154 [168]
                0.00    0.00       1/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       1/1           camlFormat__entry [140]
[169]    0.0    0.00    0.00       1         camlPervasives__at_exit_1322 [169]
                0.00    0.00       1/8207956     caml_modify [38]
-----------------------------------------------
                0.00    0.00       1/1           caml_main [172]
[170]    0.0    0.00    0.00       1         caml_init_gc [170]
                0.00    0.00       1/1           caml_init_major_heap [171]
                0.00    0.00       6/2185        caml_gc_message [203]
                0.00    0.00       2/2           norm_heapincr [298]
                0.00    0.00       1/1           caml_page_table_initialize [346]
                0.00    0.00       1/1           norm_minsize [352]
                0.00    0.00       1/1           caml_set_minor_heap_size [348]
                0.00    0.00       1/1           norm_pfree [353]
                0.00    0.00       1/1           norm_pmax [354]
-----------------------------------------------
                0.00    0.00       1/1           caml_init_gc [170]
[171]    0.0    0.00    0.00       1         caml_init_major_heap [171]
                0.00    0.00       1/1           caml_make_free_blocks [173]
                0.00    0.00       1/17          clip_heap_chunk_size [250]
                0.00    0.00       1/17          caml_alloc_for_heap [249]
                0.00    0.00       1/58          caml_page_table_add [228]
                0.00    0.00       1/45          caml_fl_init_merge [242]
-----------------------------------------------
                0.00    0.00       1/1           main [174]
[172]    0.0    0.00    0.00       1         caml_main [172]
                0.00    0.00       1/1           caml_init_gc [170]
                0.00    0.00      40/58          caml_page_table_add [228]
                0.00    0.00       1/1           caml_init_ieee_floats [344]
                0.00    0.00       1/1           caml_init_custom_operations [342]
                0.00    0.00       1/1           caml_init_signals [345]
                0.00    0.00       1/1           caml_debugger_init [339]
                0.00    0.00       1/1           caml_executable_name [340]
                0.00    0.00       1/1           caml_sys_init [350]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_init_major_heap [171]
[173]    0.0    0.00    0.00       1         caml_make_free_blocks [173]
                0.00    0.00       1/6994147     caml_fl_merge_block [40]
-----------------------------------------------
                                                 <spontaneous>
[174]    0.0    0.00    0.00                 main [174]
                0.00    0.00       1/1           caml_main [172]
-----------------------------------------------
                0.00    0.00       2/2           camlPervasives__open_in_gen_1214 [163]
[175]    0.0    0.00    0.00       2         caml_sys_open [175]
                0.00    0.00       2/30955528     caml_string_length [36]
                0.00    0.00       2/56          caml_stat_alloc [229]
                0.00    0.00       2/2           caml_convert_flag_list [290]
                0.00    0.00       2/13003       caml_enter_blocking_section [189]
                0.00    0.00       2/13003       caml_leave_blocking_section [191]
                0.00    0.00       2/4           caml_stat_free [269]
-----------------------------------------------
                0.00    0.00       1/16628563     camlSim_lexer__entry [334]
                0.00    0.00       1/16628563     camlScheduler__entry [333]
                0.00    0.00       1/16628563     camlGraph__entry [310]
                0.00    0.00       1/16628563     camlNetlist__entry [321]
                0.00    0.00       1/16628563     camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
                0.00    0.00       1/16628563     camlNetlist_lexer__entry [324]
                0.00    0.00       1/16628563     camlNetlist_parser___menhir_goto_list_equ__1226 [59]
                0.00    0.00       1/16628563     camlNetlist_parser___menhir_goto_arg_1225 [183]
                0.00    0.00       1/16628563     camlNetlist_parser__entry [327]
                0.00    0.00       1/16628563     camlPervasives__flush_all_1185 [134]
                0.00    0.00       1/16628563     camlPervasives__exit_1326 [127]
                0.00    0.00       1/16628563     camlArray__entry [302]
                0.00    0.00       1/16628563     camlString__make_1038 [162]
                0.00    0.00       1/16628563     camlNativeint__entry [320]
                0.00    0.00       1/16628563     camlLexing__new_line_1155 [74]
                0.00    0.00       1/16628563     camlMap__entry [317]
                0.00    0.00       1/16628563     camlFormat__entry [140]
                0.00    0.00       1/16628563     camlArg__entry [301]
                0.00    0.00       1/16628563     camlPrintexc__entry [331]
                0.00    0.00       1/16628563     camlRandom__new_state_1036 [146]
                0.00    0.00       1/16628563     camlRandom__full_init_1040 [69]
                0.00    0.00       1/16628563     camlRandom__make_self_init_1058 [68]
                0.00    0.00       1/16628563     camlCallback__register_exception_1034 [305]
                0.00    0.00       1/16628563     caml_main [172]
                0.00    0.00       2/16628563     camlNetlist_ast__entry [322]
                0.00    0.00       2/16628563     camlPervasives__iter_1186 [330]
                0.00    0.00       2/16628563     camlBuffer__create_1039 [153]
                0.00    0.00       2/16628563     camlPrintf__entry [332]
                0.00    0.00       2/16628563     caml_raise [294]
                0.00    0.00       3/16628563     camlSys__entry [120]
                0.00    0.00       4/16628563     camlPervasives__open_in_gen_1214 [163]
                0.00    0.00       4/16628563     camlLexing__from_function_1113 [141]
                0.00    0.00       4/16628563     camlFormat__fun_2097 [266]
                0.00    0.00       4/16628563     camlArg__assoc3_1092 [63]
                0.00    0.00       5/16628563     camlRandom__entry [149]
                0.00    0.00       6/16628563     camlMain__entry [3]
                0.00    0.00       6/16628563     camlHashtbl__create_1051 [115]
                0.00    0.00       6/16628563     camlParsing__entry [123]
                0.00    0.00       7/16628563     camlCore__entry [126]
                0.00    0.00       7/16628563     camlUnix__entry [142]
                0.00    0.00       7/16628563     camlPervasives__max_1025 [143]
                0.00    0.00       7/16628563     camlHashtbl__resize_1061 [71]
                0.00    0.00       7/16628563     camlFilename__entry [67]
                0.00    0.00       8/16628563     camlMap__bal_1081 [179]
                0.00    0.00      12/16628563     camlPervasives__entry [160]
                0.00    0.00      13/16628563     camlPervasives__min_1022 [128]
                0.00    0.00      14/16628563     camlCore__evalBinop_1123 [53]
                0.00    0.00      16/16628563     camlCore__evalExp_1171 [10]
                0.00    0.00      49/16628563     camlFormat__pp_print_char_1374 [112]
                0.00    0.00      51/16628563     camlArray__of_list_1130 [97]
                0.00    0.00      52/16628563     camlPervasives__output_1194 [234]
                0.00    0.00      53/16628563     camlHashtbl__replace_1112 [16]
                0.00    0.00     110/16628563     camlPervasives__$5e_1112 [105]
                0.00    0.00     110/16628563     camlPervasives__string_of_int_1130 [102]
                0.00    0.00     110/16628563     camlDigest__string_1033 [104]
                0.00    0.00     127/16628563     camlCore__addInput_1224 [86]
                0.00    0.00     127/16628563     camlUnix__read_1237 [1238]
                0.00    0.00     254/16628563     camlCore__fixSize_1128 [81]
                0.00    0.00    2318/16628563     camlPervasives__input_1224 [198]
                0.00    0.00   12573/16628563     camlUnix__write_1242 [1254]
                0.00    0.00   22795/16628563     camlNetlist_parser___menhir_run12_1234 [45]
                0.00    0.00   98364/16628563     camlLexing__lexeme_1122 [64]
                0.00    0.00  122762/16628563     camlLexing__sub_lexeme_1126 [62]
                0.00    0.00  327511/16628563     camlNetlist_ast__compare_1032 [54]
                0.00    0.00  335534/16628563     camlArray__append_1054 [37]
                0.00    0.00  347255/16628563     camlLexing__engine_1090 [43]
                0.00    0.00  349766/16628563     camlCore__fun_1348 [48]
                0.00    0.00  430346/16628563     camlHashtbl__find_rec_1088 [50]
                0.00    0.00  597535/16628563     camlArray__sub_1081 [28]
                0.00    0.00 1445607/16628563     camlList__assoc_1169 [39]
                0.00    0.00 5187288/16628563     camlHashtbl__replace_bucket_1116 [21]
                0.00    0.00 7347692/16628563     camlHashtbl__find_1093 [15]
[176]    0.0    0.00    0.00 16628563         caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       2/351992      camlLexing__from_function_1113 [141]
                0.00    0.00       2/351992      camlFilename__entry [67]
                0.00    0.00       3/351992      camlMain__simulate_1115 [6]
                0.00    0.00    2318/351992      camlLexing__lex_refill_1100 [197]
                0.00    0.00    5798/351992      camlMap__find_1117 [75]
                0.00    0.00   22156/351992      camlList__fold_left_1078 [58]
                0.00    0.00  321713/351992      camlMap__add_1108 [57]
[177]    0.0    0.00    0.00  351992         caml_apply2 [177]
                0.00    0.00       4/8           caml_curry3 [256]
-----------------------------------------------
                0.00    0.00       1/343671      camlNetlist_parser__program_1244 [117]
                0.00    0.00  343670/343671      camlNetlist_parser___menhir_discard_1243 [32]
[178]    0.0    0.00    0.00  343671         camlNetlist_lexer__token_1082 [178]
-----------------------------------------------
                0.00    0.00   22155/321713      camlList__fold_left_1078 [58]
                0.00    0.00  299558/321713      camlMap__add_1108 [57]
[179]    0.0    0.00    0.00  321713         camlMap__bal_1081 [179]
                0.00    0.00   22140/44280       camlMap__create_1071 [182]
                0.00    0.00       8/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     220/225631      camlPervasives__$5e_1112 [105]
                0.00    0.00    4285/225631      camlString__blit_1056 [194]
                0.00    0.00   98364/225631      camlLexing__lexeme_1122 [64]
                0.00    0.00  122762/225631      camlLexing__sub_lexeme_1126 [62]
[180]    0.0    0.00    0.00  225631         caml_blit_string [180]
-----------------------------------------------
                0.00    0.00   46250/46250       parse_intnat [88]
[181]    0.0    0.00    0.00   46250         parse_digit [181]
-----------------------------------------------
                0.00    0.00      13/44280       camlList__fold_left_1078 [58]
                0.00    0.00   22127/44280       camlMap__add_1108 [57]
                0.00    0.00   22140/44280       camlMap__bal_1081 [179]
[182]    0.0    0.00    0.00   44280         camlMap__create_1071 [182]
-----------------------------------------------
                0.00    0.00   34521/34521       camlNetlist__read_file_1033 [30]
[183]    0.0    0.00    0.00   34521         camlNetlist_parser___menhir_goto_arg_1225 [183]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00     187/26193       caml_garbage_collection [12]
                0.00    0.00   13003/26193       caml_leave_blocking_section [191]
                0.00    0.00   13003/26193       caml_enter_blocking_section [189]
[184]    0.0    0.00    0.00   26193         caml_process_pending_signals [184]
-----------------------------------------------
                0.00    0.00   24690/24690       caml_make_vect [31]
[185]    0.0    0.00    0.00   24690         caml_initialize [185]
-----------------------------------------------
                0.00    0.00   22795/22795       parse_intnat [88]
[186]    0.0    0.00    0.00   22795         parse_sign_and_base [186]
-----------------------------------------------
                0.00    0.00   22156/22156       camlList__fold_left_1078 [58]
[187]    0.0    0.00    0.00   22156         camlNetlist_ast__fun_1245 [187]
-----------------------------------------------
                0.00    0.00   22155/22155       camlNetlist__read_file_1033 [30]
[188]    0.0    0.00    0.00   22155         camlNetlist_parser___menhir_goto_exp_1227 [188]
-----------------------------------------------
                0.00    0.00       2/13003       caml_sys_open [175]
                0.00    0.00       3/13003       do_write [285]
                0.00    0.00       5/13003       caml_open_descriptor_in [265]
                0.00    0.00     127/13003       unix_read [1770]
                0.00    0.00     293/13003       caml_do_read [212]
                0.00    0.00   12573/13003       unix_write [1819]
[189]    0.0    0.00    0.00   13003         caml_enter_blocking_section [189]
                0.00    0.00   13003/26193       caml_process_pending_signals [184]
                0.00    0.00   13003/13003       caml_enter_blocking_section_default [190]
-----------------------------------------------
                0.00    0.00   13003/13003       caml_enter_blocking_section [189]
[190]    0.0    0.00    0.00   13003         caml_enter_blocking_section_default [190]
-----------------------------------------------
                0.00    0.00       2/13003       caml_sys_open [175]
                0.00    0.00       3/13003       do_write [285]
                0.00    0.00       5/13003       caml_open_descriptor_in [265]
                0.00    0.00     127/13003       unix_read [1770]
                0.00    0.00     293/13003       caml_do_read [212]
                0.00    0.00   12573/13003       unix_write [1819]
[191]    0.0    0.00    0.00   13003         caml_leave_blocking_section [191]
                0.00    0.00   13003/13003       caml_leave_blocking_section_default [192]
                0.00    0.00   13003/26193       caml_process_pending_signals [184]
-----------------------------------------------
                0.00    0.00   13003/13003       caml_leave_blocking_section [191]
[192]    0.0    0.00    0.00   13003         caml_leave_blocking_section_default [192]
-----------------------------------------------
                0.00    0.00     127/12573       camlList__iter_1074 [99]
                0.00    0.00   12446/12573       camlArray__iter_1101 [217]
[193]    0.0    0.00    0.00   12573         camlMain__aux_1122 [193]
-----------------------------------------------
                0.00    0.00    4285/4285        camlLexing__lex_refill_1100 [197]
[194]    0.0    0.00    0.00    4285         camlString__blit_1056 [194]
                0.00    0.00    4285/225631      caml_blit_string [180]
-----------------------------------------------
                0.00    0.00    2417/2417        caml_page_table_add [228]
[195]    0.0    0.00    0.00    2417         caml_page_table_modify [195]
-----------------------------------------------
                0.00    0.00    2318/2318        camlLexing__lex_refill_1100 [197]
[196]    0.0    0.00    0.00    2318         camlLexing__fun_1200 [196]
-----------------------------------------------
                0.00    0.00       1/2318        camlSim_lexer____ocaml_lex_comment_rec_1043 [84]
                0.00    0.00       3/2318        camlSim_lexer____ocaml_lex_token_rec_1041 [85]
                0.00    0.00    2314/2318        camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
[197]    0.0    0.00    0.00    2318         camlLexing__lex_refill_1100 [197]
                0.00    0.00    4285/4285        camlString__blit_1056 [194]
                0.00    0.00    2318/2318        camlPervasives__input_1224 [198]
                0.00    0.00    2318/2318        camlLexing__fun_1200 [196]
                0.00    0.00    2318/351992      caml_apply2 [177]
-----------------------------------------------
                0.00    0.00    2318/2318        camlLexing__lex_refill_1100 [197]
[198]    0.0    0.00    0.00    2318         camlPervasives__input_1224 [198]
                0.00    0.00    2318/2318        caml_ml_input [200]
                0.00    0.00    2318/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/2318        camlSim_lexer____ocaml_lex_comment_rec_1043 [84]
                0.00    0.00       3/2318        camlSim_lexer____ocaml_lex_token_rec_1041 [85]
                0.00    0.00    2314/2318        camlNetlist_lexer____ocaml_lex_token_rec_1083 [33]
[199]    0.0    0.00    0.00    2318         caml_curry3_2 [199]
-----------------------------------------------
                0.00    0.00    2318/2318        camlPervasives__input_1224 [198]
[200]    0.0    0.00    0.00    2318         caml_ml_input [200]
                0.00    0.00     293/293         caml_do_read [212]
-----------------------------------------------
                0.00    0.00    2248/2248        caml_string_notequal [202]
[201]    0.0    0.00    0.00    2248         caml_string_equal [201]
-----------------------------------------------
                0.00    0.00       2/2248        camlFilename__entry [67]
                0.00    0.00    2246/2248        camlNetlist_parser__bool_of_string_1215 [204]
[202]    0.0    0.00    0.00    2248         caml_string_notequal [202]
                0.00    0.00    2248/2248        caml_string_equal [201]
-----------------------------------------------
                0.00    0.00       4/2185        realloc_gray_vals [263]
                0.00    0.00       6/2185        caml_init_gc [170]
                0.00    0.00      16/2185        caml_add_to_heap [251]
                0.00    0.00      44/2185        start_cycle [78]
                0.00    0.00      82/2185        caml_compact_heap_maybe [245]
                0.00    0.00     127/2185        sweep_slice [27]
                0.00    0.00     178/2185        mark_slice [24]
                0.00    0.00     432/2185        caml_empty_minor_heap [19]
                0.00    0.00    1296/2185        caml_major_collection_slice [18]
[203]    0.0    0.00    0.00    2185         caml_gc_message [203]
-----------------------------------------------
                0.00    0.00    1603/1603        camlNetlist_parser__value_of_const_1221 [205]
[204]    0.0    0.00    0.00    1603         camlNetlist_parser__bool_of_string_1215 [204]
                0.00    0.00    2246/2248        caml_string_notequal [202]
-----------------------------------------------
                0.00    0.00    1603/1603        camlNetlist_parser___menhir_run25_1230 [70]
[205]    0.0    0.00    0.00    1603         camlNetlist_parser__value_of_const_1221 [205]
                0.00    0.00    1603/1603        camlNetlist_parser__bool_of_string_1215 [204]
-----------------------------------------------
                0.00    0.00     712/712         camlSim_lexer__read_file_1053 [80]
[206]    0.0    0.00    0.00     712         camlSim_lexer__comment_1042 [206]
-----------------------------------------------
                0.00    0.00     546/546         camlSim_lexer__read_file_1053 [80]
[207]    0.0    0.00    0.00     546         camlSim_lexer__token_1040 [207]
-----------------------------------------------
                0.00    0.00     432/432         caml_empty_minor_heap [19]
[208]    0.0    0.00    0.00     432         caml_final_empty_young [208]
-----------------------------------------------
                0.00    0.00     432/432         caml_empty_minor_heap [19]
[209]    0.0    0.00    0.00     432         clear_table [209]
-----------------------------------------------
                0.00    0.00     381/381         camlCore__getAddr_1145 [211]
[210]    0.0    0.00    0.00     381         camlCore__array_of_value_1110 [210]
-----------------------------------------------
                0.00    0.00     127/381         camlCore__evalExp_1171 [10]
                0.00    0.00     254/381         camlCore__ramHandler_1158 [220]
[211]    0.0    0.00    0.00     381         camlCore__getAddr_1145 [211]
                0.00    0.00     381/381         camlCore__array_of_value_1110 [210]
-----------------------------------------------
                0.00    0.00     293/293         caml_ml_input [200]
[212]    0.0    0.00    0.00     293         caml_do_read [212]
                0.00    0.00     293/13003       caml_enter_blocking_section [189]
                0.00    0.00     293/13003       caml_leave_blocking_section [191]
-----------------------------------------------
                0.00    0.00     254/254         camlList__iter_1074 [99]
[213]    0.0    0.00    0.00     254         camlMain__fun_1166 [213]
-----------------------------------------------
                0.00    0.00     216/216         caml_minor_collection [11]
[214]    0.0    0.00    0.00     216         caml_final_do_calls [214]
-----------------------------------------------
                0.00    0.00     216/216         caml_oldify_local_roots [90]
[215]    0.0    0.00    0.00     216         caml_final_do_young_roots [215]
-----------------------------------------------
                0.00    0.00       1/179         camlMain__loadRom_1111 [79]
                0.00    0.00     178/179         camlSim_lexer__handleNewline_1037 [96]
[216]    0.0    0.00    0.00     179         camlList__rev_append_1051 [216]
-----------------------------------------------
                0.00    0.00     127/127         camlList__iter_1074 [99]
[217]    0.0    0.00    0.00     127         camlArray__iter_1101 [217]
                0.00    0.00   12446/12573       camlMain__aux_1122 [193]
-----------------------------------------------
                0.00    0.00     127/127         camlCore__ramHandler_1158 [220]
[218]    0.0    0.00    0.00     127         camlCore__bool_of_value_1113 [218]
-----------------------------------------------
                0.00    0.00     127/127         camlCore__aux_1231 [82]
[219]    0.0    0.00    0.00     127         camlCore__fun_1374 [219]
-----------------------------------------------
                0.00    0.00     127/127         camlCore__applyEq_1259 [9]
[220]    0.0    0.00    0.00     127         camlCore__ramHandler_1158 [220]
                0.00    0.00     254/381         camlCore__getAddr_1145 [211]
                0.00    0.00     127/127         camlCore__bool_of_value_1113 [218]
-----------------------------------------------
                0.00    0.00     127/127         camlMain__check_power_1126 [109]
[221]    0.0    0.00    0.00     127         camlMain__output_1120 [221]
-----------------------------------------------
                0.00    0.00     110/110         camlRandom__full_init_1040 [69]
[222]    0.0    0.00    0.00     110         camlRandom__extract_1046 [222]
-----------------------------------------------
                0.00    0.00     110/110         caml_md5_string [106]
[223]    0.0    0.00    0.00     110         caml_MD5Final [223]
                0.00    0.00     110/110         caml_MD5Transform [225]
-----------------------------------------------
                0.00    0.00     110/110         caml_md5_string [106]
[224]    0.0    0.00    0.00     110         caml_MD5Init [224]
-----------------------------------------------
                0.00    0.00     110/110         caml_MD5Final [223]
[225]    0.0    0.00    0.00     110         caml_MD5Transform [225]
-----------------------------------------------
                0.00    0.00     110/110         caml_md5_string [106]
[226]    0.0    0.00    0.00     110         caml_MD5Update [226]
-----------------------------------------------
                0.00    0.00     106/106         camlFormat__advance_loop_1271 [122]
[227]    0.0    0.00    0.00     106         camlFormat__peek_queue_1186 [227]
-----------------------------------------------
                0.00    0.00       1/58          caml_init_major_heap [171]
                0.00    0.00       1/58          caml_set_minor_heap_size [348]
                0.00    0.00      16/58          caml_add_to_heap [251]
                0.00    0.00      40/58          caml_main [172]
[228]    0.0    0.00    0.00      58         caml_page_table_add [228]
                0.00    0.00    2417/2417        caml_page_table_modify [195]
-----------------------------------------------
                0.00    0.00       1/56          caml_init_frame_descriptors [343]
                0.00    0.00       1/56          caml_alloc_table [337]
                0.00    0.00       2/56          caml_insert_global_root [292]
                0.00    0.00       2/56          caml_sys_open [175]
                0.00    0.00       2/56          caml_register_named_value [296]
                0.00    0.00       3/56          caml_register_custom_operations [284]
                0.00    0.00       5/56          caml_open_descriptor_in [265]
                0.00    0.00      40/56          cons [247]
[229]    0.0    0.00    0.00      56         caml_stat_alloc [229]
-----------------------------------------------
                0.00    0.00       2/54          camlFilename__entry [67]
                0.00    0.00       3/54          camlFormat__pp_flush_queue_1351 [164]
                0.00    0.00      49/54          camlFormat__format_pp_token_1227 [166]
[230]    0.0    0.00    0.00      54         caml_apply3 [230]
                0.00    0.00      54/54          caml_curry4_1 [231]
                0.00    0.00      52/54          caml_curry4_2 [232]
                0.00    0.00       2/5           caml_curry4 [264]
-----------------------------------------------
                0.00    0.00      54/54          caml_apply3 [230]
[231]    0.0    0.00    0.00      54         caml_curry4_1 [231]
-----------------------------------------------
                0.00    0.00       2/54          camlFilename__entry [67]
                0.00    0.00      52/54          caml_apply3 [230]
[232]    0.0    0.00    0.00      54         caml_curry4_2 [232]
-----------------------------------------------
                0.00    0.00       1/53          camlPrintf__entry [332]
                0.00    0.00       1/53          camlFilename__entry [67]
                0.00    0.00       3/53          camlFormat__eprintf_1772 [271]
                0.00    0.00       6/53          camlFormat__make_formatter_1493 [152]
                0.00    0.00      42/53          camlFormat__entry [140]
[233]    0.0    0.00    0.00      53         caml_curry2 [233]
-----------------------------------------------
                0.00    0.00       3/52          camlFormat__pp_flush_queue_1351 [164]
                0.00    0.00      49/52          camlFormat__format_pp_token_1227 [166]
[234]    0.0    0.00    0.00      52         camlPervasives__output_1194 [234]
                0.00    0.00      52/52          caml_ml_output [236]
                0.00    0.00      52/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       3/52          camlFormat__pp_flush_queue_1351 [164]
                0.00    0.00      49/52          camlFormat__format_pp_token_1227 [166]
[235]    0.0    0.00    0.00      52         caml_curry4_3 [235]
-----------------------------------------------
                0.00    0.00      52/52          camlPervasives__output_1194 [234]
[236]    0.0    0.00    0.00      52         caml_ml_output [236]
                0.00    0.00      52/52          caml_putblock [237]
-----------------------------------------------
                0.00    0.00      52/52          caml_ml_output [236]
[237]    0.0    0.00    0.00      52         caml_putblock [237]
-----------------------------------------------
                0.00    0.00      51/51          camlArray__of_list_1130 [97]
[238]    0.0    0.00    0.00      51         camlArray__list_length_1126 [238]
-----------------------------------------------
                0.00    0.00      49/49          camlFormat__doprn_1625 [108]
[239]    0.0    0.00    0.00      49         camlFormat__enqueue_string_as_1286 [239]
-----------------------------------------------
                0.00    0.00      49/49          camlFormat__format_pp_token_1227 [166]
[240]    0.0    0.00    0.00      49         camlFormat__pp_output_string_1199 [240]
-----------------------------------------------
                0.00    0.00      49/49          camlFormat__doprn_1625 [108]
[241]    0.0    0.00    0.00      49         camlFormat__pp_print_as_char_1619 [241]
-----------------------------------------------
                0.00    0.00       1/45          caml_init_major_heap [171]
                0.00    0.00      44/45          mark_slice [24]
[242]    0.0    0.00    0.00      45         caml_fl_init_merge [242]
-----------------------------------------------
                0.00    0.00      44/44          caml_do_roots [77]
[243]    0.0    0.00    0.00      44         caml_final_do_strong_roots [243]
-----------------------------------------------
                0.00    0.00      44/44          mark_slice [24]
[244]    0.0    0.00    0.00      44         caml_final_update [244]
-----------------------------------------------
                0.00    0.00      43/43          caml_major_collection_slice [18]
[245]    0.0    0.00    0.00      43         caml_compact_heap_maybe [245]
                0.00    0.00      82/2185        caml_gc_message [203]
-----------------------------------------------
                0.00    0.00      40/40          caml_init_frame_descriptors [343]
[246]    0.0    0.00    0.00      40         caml_register_frametable [246]
                0.00    0.00      40/40          cons [247]
-----------------------------------------------
                0.00    0.00      40/40          caml_register_frametable [246]
[247]    0.0    0.00    0.00      40         cons [247]
                0.00    0.00      40/56          caml_stat_alloc [229]
-----------------------------------------------
                0.00    0.00       1/18          caml_set_minor_heap_size [348]
                0.00    0.00      17/18          caml_alloc_for_heap [249]
[248]    0.0    0.00    0.00      18         caml_aligned_malloc [248]
-----------------------------------------------
                0.00    0.00       1/17          caml_init_major_heap [171]
                0.00    0.00      16/17          caml_alloc_shr [29]
[249]    0.0    0.00    0.00      17         caml_alloc_for_heap [249]
                0.00    0.00      17/18          caml_aligned_malloc [248]
-----------------------------------------------
                0.00    0.00       1/17          caml_init_major_heap [171]
                0.00    0.00      16/17          caml_round_heap_chunk_size [253]
[250]    0.0    0.00    0.00      17         clip_heap_chunk_size [250]
-----------------------------------------------
                0.00    0.00      16/16          caml_alloc_shr [29]
[251]    0.0    0.00    0.00      16         caml_add_to_heap [251]
                0.00    0.00      16/2185        caml_gc_message [203]
                0.00    0.00      16/58          caml_page_table_add [228]
-----------------------------------------------
                0.00    0.00      16/16          caml_alloc_shr [29]
[252]    0.0    0.00    0.00      16         caml_fl_add_blocks [252]
-----------------------------------------------
                0.00    0.00      16/16          caml_alloc_shr [29]
[253]    0.0    0.00    0.00      16         caml_round_heap_chunk_size [253]
                0.00    0.00      16/17          clip_heap_chunk_size [250]
-----------------------------------------------
                0.00    0.00       2/15          caml_alloc_string [55]
                0.00    0.00       6/15          caml_make_vect [31]
                0.00    0.00       7/15          caml_alloc_custom [148]
[254]    0.0    0.00    0.00      15         caml_check_urgent_gc [254]
-----------------------------------------------
                0.00    0.00       4/10          unix_gettimeofday [1747]
                0.00    0.00       6/10          caml_int64_float_of_bits [261]
[255]    0.0    0.00    0.00      10         caml_copy_double [255]
-----------------------------------------------
                0.00    0.00       4/8           caml_apply2 [177]
                0.00    0.00       4/8           camlFormat__entry [140]
[256]    0.0    0.00    0.00       8         caml_curry3 [256]
-----------------------------------------------
                0.00    0.00       7/7           caml_alloc_custom [148]
[257]    0.0    0.00    0.00       7         caml_adjust_gc_speed [257]
-----------------------------------------------
                0.00    0.00       1/7           camlPervasives__fun_1500 [157]
                0.00    0.00       3/7           camlMain__simulate_1115 [6]
                0.00    0.00       3/7           camlFormat__pp_flush_queue_1351 [164]
[258]    0.0    0.00    0.00       7         caml_curry2_1 [258]
-----------------------------------------------
                0.00    0.00       6/6           caml_ml_flush [262]
[259]    0.0    0.00    0.00       6         caml_flush [259]
                0.00    0.00       6/6           caml_flush_partial [260]
-----------------------------------------------
                0.00    0.00       6/6           caml_flush [259]
[260]    0.0    0.00    0.00       6         caml_flush_partial [260]
                0.00    0.00       3/3           do_write [285]
-----------------------------------------------
                0.00    0.00       6/6           camlPervasives__entry [160]
[261]    0.0    0.00    0.00       6         caml_int64_float_of_bits [261]
                0.00    0.00       6/10          caml_copy_double [255]
-----------------------------------------------
                0.00    0.00       2/6           camlPervasives__iter_1186 [330]
                0.00    0.00       4/6           camlFormat__fun_2097 [266]
[262]    0.0    0.00    0.00       6         caml_ml_flush [262]
                0.00    0.00       6/6           caml_flush [259]
-----------------------------------------------
                0.00    0.00       6/6           mark_slice [24]
[263]    0.0    0.00    0.00       6         realloc_gray_vals [263]
                0.00    0.00       4/2185        caml_gc_message [203]
-----------------------------------------------
                0.00    0.00       1/5           camlFormat__formatter_of_buffer_1499 [309]
                0.00    0.00       2/5           caml_apply3 [230]
                0.00    0.00       2/5           camlFormat__formatter_of_out_channel_1497 [286]
[264]    0.0    0.00    0.00       5         caml_curry4 [264]
-----------------------------------------------
                0.00    0.00       2/5           caml_open_descriptor_out [293]
                0.00    0.00       3/5           caml_ml_open_descriptor_in [159]
[265]    0.0    0.00    0.00       5         caml_open_descriptor_in [265]
                0.00    0.00       5/56          caml_stat_alloc [229]
                0.00    0.00       5/13003       caml_enter_blocking_section [189]
                0.00    0.00       5/13003       caml_leave_blocking_section [191]
-----------------------------------------------
                0.00    0.00       1/4           camlPervasives__fun_1500 [157]
                0.00    0.00       3/4           camlFormat__doprn_1625 [108]
[266]    0.0    0.00    0.00       4         camlFormat__fun_2097 [266]
                0.00    0.00       4/6           caml_ml_flush [262]
                0.00    0.00       4/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/4           camlFormat__pp_print_flush_1393 [156]
                0.00    0.00       3/4           camlFormat__pp_print_newline_1392 [131]
[267]    0.0    0.00    0.00       4         camlFormat__pp_open_box_gen_1312 [267]
-----------------------------------------------
                0.00    0.00       2/4           camlLexing__from_function_1113 [141]
                0.00    0.00       2/4           camlFilename__entry [67]
[268]    0.0    0.00    0.00       4         caml_curry3_1 [268]
-----------------------------------------------
                0.00    0.00       2/4           caml_finalize_channel [291]
                0.00    0.00       2/4           caml_sys_open [175]
[269]    0.0    0.00    0.00       4         caml_stat_free [269]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__pp_flush_queue_1351 [164]
[270]    0.0    0.00    0.00       3         camlFormat__display_newline_1469 [270]
-----------------------------------------------
                0.00    0.00       3/3           camlMain__simulate_1115 [6]
[271]    0.0    0.00    0.00       3         camlFormat__eprintf_1772 [271]
                0.00    0.00       3/53          caml_curry2 [233]
                0.00    0.00       3/3           camlFormat__kfprintf_1760 [275]
                0.00    0.00       3/3           camlFormat__fprintf_1766 [272]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__eprintf_1772 [271]
[272]    0.0    0.00    0.00       3         camlFormat__fprintf_1766 [272]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__kpr_1614 [276]
[273]    0.0    0.00    0.00       3         camlFormat__fun_2645 [273]
-----------------------------------------------
                0.00    0.00       3/3           camlMain__simulate_1115 [6]
[274]    0.0    0.00    0.00       3         camlFormat__fun_2653 [274]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__eprintf_1772 [271]
[275]    0.0    0.00    0.00       3         camlFormat__kfprintf_1760 [275]
                0.00    0.00       3/3           camlFormat__mkprintf_1607 [278]
-----------------------------------------------
                0.00    0.00       3/3           camlMain__simulate_1115 [6]
[276]    0.0    0.00    0.00       3         camlFormat__kpr_1614 [276]
                0.00    0.00       3/3           camlFormat__fun_2645 [273]
                0.00    0.00       3/3           camlPrintf__index_of_int_1037 [280]
-----------------------------------------------
                0.00    0.00       3/3           camlMain__simulate_1115 [6]
[277]    0.0    0.00    0.00       3         camlFormat__kprintf_1610 [277]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__kfprintf_1760 [275]
[278]    0.0    0.00    0.00       3         camlFormat__mkprintf_1607 [278]
-----------------------------------------------
                0.00    0.00       3/3           camlPrintf__kapr_1209 [282]
[279]    0.0    0.00    0.00       3         camlPrintf__ac_of_format_1184 [279]
                0.00    0.00       3/3           camlPrintf__iter_on_format_args_1137 [281]
-----------------------------------------------
                0.00    0.00       3/3           camlFormat__kpr_1614 [276]
[280]    0.0    0.00    0.00       3         camlPrintf__index_of_int_1037 [280]
-----------------------------------------------
                0.00    0.00       3/3           camlPrintf__ac_of_format_1184 [279]
[281]    0.0    0.00    0.00       3         camlPrintf__iter_on_format_args_1137 [281]
                0.00    0.00       3/3           camlPrintf__scan_fmt_1144 [283]
-----------------------------------------------
                0.00    0.00       3/3           camlMain__simulate_1115 [6]
[282]    0.0    0.00    0.00       3         camlPrintf__kapr_1209 [282]
                0.00    0.00       3/3           camlPrintf__ac_of_format_1184 [279]
-----------------------------------------------
                0.00    0.00       3/3           camlPrintf__iter_on_format_args_1137 [281]
[283]    0.0    0.00    0.00       3         camlPrintf__scan_fmt_1144 [283]
-----------------------------------------------
                0.00    0.00       3/3           caml_init_custom_operations [342]
[284]    0.0    0.00    0.00       3         caml_register_custom_operations [284]
                0.00    0.00       3/56          caml_stat_alloc [229]
-----------------------------------------------
                0.00    0.00       3/3           caml_flush_partial [260]
[285]    0.0    0.00    0.00       3         do_write [285]
                0.00    0.00       3/13003       caml_enter_blocking_section [189]
                0.00    0.00       3/13003       caml_leave_blocking_section [191]
-----------------------------------------------
                0.00    0.00       2/2           camlFormat__entry [140]
[286]    0.0    0.00    0.00       2         camlFormat__formatter_of_out_channel_1497 [286]
                0.00    0.00       2/5           caml_curry4 [264]
-----------------------------------------------
                0.00    0.00       1/2           camlSim_lexer__read_file_1053 [80]
                0.00    0.00       1/2           camlNetlist__read_file_1033 [30]
[287]    0.0    0.00    0.00       2         camlLexing__from_channel_1115 [287]
-----------------------------------------------
                0.00    0.00       2/2           camlNetlist__read_file_1033 [30]
[288]    0.0    0.00    0.00       2         camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_NAME__1239 [288]
-----------------------------------------------
                0.00    0.00       1/2           camlSim_lexer__read_file_1053 [80]
                0.00    0.00       1/2           camlNetlist__find_file_1031 [167]
[289]    0.0    0.00    0.00       2         camlPervasives__open_in_1218 [289]
-----------------------------------------------
                0.00    0.00       2/2           caml_sys_open [175]
[290]    0.0    0.00    0.00       2         caml_convert_flag_list [290]
-----------------------------------------------
                0.00    0.00       2/2           sweep_slice [27]
[291]    0.0    0.00    0.00       2         caml_finalize_channel [291]
                0.00    0.00       2/2           unlink_channel [300]
                0.00    0.00       2/4           caml_stat_free [269]
-----------------------------------------------
                0.00    0.00       2/2           caml_register_global_root [295]
[292]    0.0    0.00    0.00       2         caml_insert_global_root [292]
                0.00    0.00       2/56          caml_stat_alloc [229]
-----------------------------------------------
                0.00    0.00       2/2           caml_ml_open_descriptor_out [165]
[293]    0.0    0.00    0.00       2         caml_open_descriptor_out [293]
                0.00    0.00       2/5           caml_open_descriptor_in [265]
-----------------------------------------------
                0.00    0.00       2/2           caml_raise_constant [137]
[294]    0.0    0.00    0.00       2         caml_raise [294]
                0.00    0.00       2/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       2/2           caml_register_named_value [296]
[295]    0.0    0.00    0.00       2         caml_register_global_root [295]
                0.00    0.00       2/2           caml_insert_global_root [292]
-----------------------------------------------
                0.00    0.00       1/2           camlPervasives__entry [160]
                0.00    0.00       1/2           camlCallback__register_exception_1034 [305]
[296]    0.0    0.00    0.00       2         caml_register_named_value [296]
                0.00    0.00       2/2           hash_value_name [297]
                0.00    0.00       2/56          caml_stat_alloc [229]
                0.00    0.00       2/2           caml_register_global_root [295]
-----------------------------------------------
                0.00    0.00       2/2           caml_register_named_value [296]
[297]    0.0    0.00    0.00       2         hash_value_name [297]
-----------------------------------------------
                0.00    0.00       2/2           caml_init_gc [170]
[298]    0.0    0.00    0.00       2         norm_heapincr [298]
-----------------------------------------------
                0.00    0.00       2/2           caml_set_minor_heap_size [348]
[299]    0.0    0.00    0.00       2         reset_table [299]
-----------------------------------------------
                0.00    0.00       2/2           caml_finalize_channel [291]
[300]    0.0    0.00    0.00       2         unlink_channel [300]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[301]    0.0    0.00    0.00       1         camlArg__entry [301]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[302]    0.0    0.00    0.00       1         camlArray__entry [302]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[303]    0.0    0.00    0.00       1         camlBuffer__entry [303]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[304]    0.0    0.00    0.00       1         camlCallback__entry [304]
-----------------------------------------------
                0.00    0.00       1/1           camlUnix__entry [142]
[305]    0.0    0.00    0.00       1         camlCallback__register_exception_1034 [305]
                0.00    0.00       1/2           caml_register_named_value [296]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[306]    0.0    0.00    0.00       1         camlChar__entry [306]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[307]    0.0    0.00    0.00       1         camlDebug__entry [307]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[308]    0.0    0.00    0.00       1         camlDigest__entry [308]
-----------------------------------------------
                0.00    0.00       1/1           camlFormat__entry [140]
[309]    0.0    0.00    0.00       1         camlFormat__formatter_of_buffer_1499 [309]
                0.00    0.00       1/5           caml_curry4 [264]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[310]    0.0    0.00    0.00       1         camlGraph__entry [310]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[311]    0.0    0.00    0.00       1         camlHashtbl__entry [311]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[312]    0.0    0.00    0.00       1         camlInt32__entry [312]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[313]    0.0    0.00    0.00       1         camlInt64__entry [313]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[314]    0.0    0.00    0.00       1         camlLexing__entry [314]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[315]    0.0    0.00    0.00       1         camlList__entry [315]
-----------------------------------------------
                0.00    0.00       1/1           camlMap__fun_1920 [318]
[316]    0.0    0.00    0.00       1         camlMap__Make_1355 [316]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[317]    0.0    0.00    0.00       1         camlMap__entry [317]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           camlNetlist_ast__entry [322]
[318]    0.0    0.00    0.00       1         camlMap__fun_1920 [318]
                0.00    0.00       1/1           camlMap__Make_1355 [316]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[319]    0.0    0.00    0.00       1         camlMarshal__entry [319]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[320]    0.0    0.00    0.00       1         camlNativeint__entry [320]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[321]    0.0    0.00    0.00       1         camlNetlist__entry [321]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[322]    0.0    0.00    0.00       1         camlNetlist_ast__entry [322]
                0.00    0.00       2/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       1/1           camlMap__fun_1920 [318]
-----------------------------------------------
                0.00    0.00       1/1           camlNetlist_parser___menhir_goto_list_equ__1226 [59]
[323]    0.0    0.00    0.00       1         camlNetlist_ast__of_list_1114 [323]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[324]    0.0    0.00    0.00       1         camlNetlist_lexer__entry [324]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           camlNetlist__read_file_1033 [30]
[325]    0.0    0.00    0.00       1         camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_var__1228 [325]
-----------------------------------------------
                0.00    0.00       1/1           camlNetlist__read_file_1033 [30]
[326]    0.0    0.00    0.00       1         camlNetlist_parser___menhir_reduce18_1231 [326]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[327]    0.0    0.00    0.00       1         camlNetlist_parser__entry [327]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[328]    0.0    0.00    0.00       1         camlNetlist_printer__entry [328]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[329]    0.0    0.00    0.00       1         camlObj__entry [329]
-----------------------------------------------
                0.00    0.00       1/1           camlPervasives__exit_1326 [127]
[330]    0.0    0.00    0.00       1         camlPervasives__iter_1186 [330]
                0.00    0.00       2/6           caml_ml_flush [262]
                0.00    0.00       2/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[331]    0.0    0.00    0.00       1         camlPrintexc__entry [331]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[332]    0.0    0.00    0.00       1         camlPrintf__entry [332]
                0.00    0.00       2/16628563     caml_debugger_cleanup_fork [176]
                0.00    0.00       1/53          caml_curry2 [233]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[333]    0.0    0.00    0.00       1         camlScheduler__entry [333]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[334]    0.0    0.00    0.00       1         camlSim_lexer__entry [334]
                0.00    0.00       1/16628563     caml_debugger_cleanup_fork [176]
-----------------------------------------------
                0.00    0.00       1/1           caml_program [1]
[335]    0.0    0.00    0.00       1         camlString__entry [335]
-----------------------------------------------
                0.00    0.00       1/1           caml_alloc_array [132]
[336]    0.0    0.00    0.00       1         caml_alloc [336]
-----------------------------------------------
                0.00    0.00       1/1           caml_realloc_ref_table [347]
[337]    0.0    0.00    0.00       1         caml_alloc_table [337]
                0.00    0.00       1/56          caml_stat_alloc [229]
-----------------------------------------------
                0.00    0.00       1/1           camlFormat__entry [140]
[338]    0.0    0.00    0.00       1         caml_curry5 [338]
-----------------------------------------------
                0.00    0.00       1/1           caml_main [172]
[339]    0.0    0.00    0.00       1         caml_debugger_init [339]
-----------------------------------------------
                0.00    0.00       1/1           caml_main [172]
[340]    0.0    0.00    0.00       1         caml_executable_name [340]
-----------------------------------------------
                0.00    0.00       1/1           camlString__make_1038 [162]
[341]    0.0    0.00    0.00       1         caml_fill_string [341]
-----------------------------------------------
                0.00    0.00       1/1           caml_main [172]
[342]    0.0    0.00    0.00       1         caml_init_custom_operations [342]
                0.00    0.00       3/3           caml_register_custom_operations [284]
-----------------------------------------------
                0.00    0.00       1/1           caml_oldify_local_roots [90]
[343]    0.0    0.00    0.00       1         caml_init_frame_descriptors [343]
                0.00    0.00      40/40          caml_register_frametable [246]
                0.00    0.00       1/56          caml_stat_alloc [229]
-----------------------------------------------
                0.00    0.00       1/1           caml_main [172]
[344]    0.0    0.00    0.00       1         caml_init_ieee_floats [344]
-----------------------------------------------
                0.00    0.00       1/1           caml_main [172]
[345]    0.0    0.00    0.00       1         caml_init_signals [345]
-----------------------------------------------
                0.00    0.00       1/1           caml_init_gc [170]
[346]    0.0    0.00    0.00       1         caml_page_table_initialize [346]
-----------------------------------------------
                0.00    0.00       1/1           caml_modify [38]
[347]    0.0    0.00    0.00       1         caml_realloc_ref_table [347]
                0.00    0.00       1/1           caml_alloc_table [337]
-----------------------------------------------
                0.00    0.00       1/1           caml_init_gc [170]
[348]    0.0    0.00    0.00       1         caml_set_minor_heap_size [348]
                0.00    0.00       2/2           reset_table [299]
                0.00    0.00       1/18          caml_aligned_malloc [248]
                0.00    0.00       1/58          caml_page_table_add [228]
-----------------------------------------------
                0.00    0.00       1/1           camlPervasives__exit_1326 [127]
[349]    0.0    0.00    0.00       1         caml_sys_exit [349]
-----------------------------------------------
                0.00    0.00       1/1           caml_main [172]
[350]    0.0    0.00    0.00       1         caml_sys_init [350]
-----------------------------------------------
                0.00    0.00       1/1           camlRandom__make_self_init_1058 [68]
[351]    0.0    0.00    0.00       1         caml_sys_random_seed [351]
-----------------------------------------------
                0.00    0.00       1/1           caml_init_gc [170]
[352]    0.0    0.00    0.00       1         norm_minsize [352]
-----------------------------------------------
                0.00    0.00       1/1           caml_init_gc [170]
[353]    0.0    0.00    0.00       1         norm_pfree [353]
-----------------------------------------------
                0.00    0.00       1/1           caml_init_gc [170]
[354]    0.0    0.00    0.00       1         norm_pmax [354]
-----------------------------------------------

 This table describes the call tree of the program, and was sorted by
 the total amount of time spent in each function and its children.

 Each entry in this table consists of several lines.  The line with the
 index number at the left hand margin lists the current function.
 The lines above it list the functions that called this function,
 and the lines below it list the functions this one called.
 This line lists:
     index	A unique number given to each element of the table.
		Index numbers are sorted numerically.
		The index number is printed next to every function name so
		it is easier to look up where the function in the table.

     % time	This is the percentage of the `total' time that was spent
		in this function and its children.  Note that due to
		different viewpoints, functions excluded by options, etc,
		these numbers will NOT add up to 100%.

     self	This is the total amount of time spent in this function.

     children	This is the total amount of time propagated into this
		function by its children.

     called	This is the number of times the function was called.
		If the function called itself recursively, the number
		only includes non-recursive calls, and is followed by
		a `+' and the number of recursive calls.

     name	The name of the current function.  The index number is
		printed after it.  If the function is a member of a
		cycle, the cycle number is printed between the
		function's name and the index number.


 For the function's parents, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the function into this parent.

     children	This is the amount of time that was propagated from
		the function's children into this parent.

     called	This is the number of times this parent called the
		function `/' the total number of times the function
		was called.  Recursive calls to the function are not
		included in the number after the `/'.

     name	This is the name of the parent.  The parent's index
		number is printed after it.  If the parent is a
		member of a cycle, the cycle number is printed between
		the name and the index number.

 If the parents of the function cannot be determined, the word
 `<spontaneous>' is printed in the `name' field, and all the other
 fields are blank.

 For the function's children, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the child into the function.

     children	This is the amount of time that was propagated from the
		child's children to the function.

     called	This is the number of times the function called
		this child `/' the total number of times the child
		was called.  Recursive calls by the child are not
		listed in the number after the `/'.

     name	This is the name of the child.  The child's index
		number is printed after it.  If the child is a
		member of a cycle, the cycle number is printed
		between the name and the index number.

 If there are any cycles (circles) in the call graph, there is an
 entry for the cycle-as-a-whole.  This entry shows who called the
 cycle (as parents) and the members of the cycle (as children.)
 The `+' recursive calls entry shows the number of function calls that
 were internal to the cycle, and the calls entry for each member shows,
 for that member, how many times it was called from other members of
 the cycle.


Index by function name

  [42] allocate_block        [182] camlMap__create_1071   [76] caml_darken_all_roots
  [63] camlArg__assoc3_1092  [317] camlMap__entry        [176] caml_debugger_cleanup_fork
 [301] camlArg__entry         [75] camlMap__find_1117    [339] caml_debugger_init
   [4] camlArg__parse_1178   [318] camlMap__fun_1920     [110] caml_do_local_roots
   [5] camlArg__parse_argv_1132 [319] camlMarshal__entry [212] caml_do_read
 [168] camlArg__treat_action_1154 [320] camlNativeint__entry [77] caml_do_roots
  [37] camlArray__append_1054 [321] camlNetlist__entry    [19] caml_empty_minor_heap
 [302] camlArray__entry      [167] camlNetlist__find_file_1031 [189] caml_enter_blocking_section
 [113] camlArray__fill_1135   [30] camlNetlist__read_file_1033 [190] caml_enter_blocking_section_default
 [217] camlArray__iter_1101   [54] camlNetlist_ast__compare_1032 [60] caml_equal
 [238] camlArray__list_length_1126 [322] camlNetlist_ast__entry [340] caml_executable_name
  [97] camlArray__of_list_1130 [187] camlNetlist_ast__fun_1245 [341] caml_fill_string
  [28] camlArray__sub_1081   [323] camlNetlist_ast__of_list_1114 [214] caml_final_do_calls
 [153] camlBuffer__create_1039 [33] camlNetlist_lexer____ocaml_lex_token_rec_1083 [243] caml_final_do_strong_roots
 [303] camlBuffer__entry     [324] camlNetlist_lexer__entry [215] caml_final_do_young_roots
 [304] camlCallback__entry   [178] camlNetlist_lexer__token_1082 [208] caml_final_empty_young
 [305] camlCallback__register_exception_1034 [32] camlNetlist_parser___menhir_discard_1243 [244] caml_final_update
 [306] camlChar__entry       [183] camlNetlist_parser___menhir_goto_arg_1225 [291] caml_finalize_channel
  [86] camlCore__addInput_1224 [188] camlNetlist_parser___menhir_goto_exp_1227 [252] caml_fl_add_blocks
   [9] camlCore__applyEq_1259 [59] camlNetlist_parser___menhir_goto_list_equ__1226 [34] caml_fl_allocate
 [210] camlCore__array_of_value_1110 [114] camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_NAME___1238 [242] caml_fl_init_merge
  [82] camlCore__aux_1231    [119] camlNetlist_parser___menhir_goto_loption_separated_nonempty_list_COMMA_var___1235 [40] caml_fl_merge_block
 [218] camlCore__bool_of_value_1113 [288] camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_NAME__1239 [259] caml_flush
 [126] camlCore__entry       [325] camlNetlist_parser___menhir_goto_separated_nonempty_list_COMMA_var__1228 [260] caml_flush_partial
  [14] camlCore__evalArg_1120 [51] camlNetlist_parser___menhir_goto_ty_exp_1233 [103] caml_format_int
  [53] camlCore__evalBinop_1123 [326] camlNetlist_parser___menhir_reduce18_1231 [12] caml_garbage_collection
  [83] camlCore__evalDefault_1249 [47] camlNetlist_parser___menhir_run10_1236 [203] caml_gc_message
  [10] camlCore__evalExp_1171 [45] camlNetlist_parser___menhir_run12_1234 [144] caml_greaterequal
  [81] camlCore__fixSize_1128 [41] camlNetlist_parser___menhir_run21_1232 [25] caml_hash_univ_param
  [48] camlCore__fun_1348     [46] camlNetlist_parser___menhir_run24_1229 [342] caml_init_custom_operations
 [219] camlCore__fun_1374     [70] camlNetlist_parser___menhir_run25_1230 [343] caml_init_frame_descriptors
 [211] camlCore__getAddr_1145 [111] camlNetlist_parser___menhir_run2_1242 [170] caml_init_gc
  [92] camlCore__getOutput_1265 [204] camlNetlist_parser__bool_of_string_1215 [344] caml_init_ieee_floats
  [94] camlCore__getRamTable_1168 [327] camlNetlist_parser__entry [171] caml_init_major_heap
  [91] camlCore__getWord_1135 [117] camlNetlist_parser__program_1244 [345] caml_init_signals
  [66] camlCore__oldValue_1252 [205] camlNetlist_parser__value_of_const_1221 [185] caml_initialize
 [220] camlCore__ramHandler_1158 [328] camlNetlist_printer__entry [292] caml_insert_global_root
   [8] camlCore__tic_1245    [329] camlObj__entry        [261] caml_int64_float_of_bits
  [89] camlCore__var_list_length_1219 [123] camlParsing__entry [87] caml_int_of_string
 [307] camlDebug__entry      [105] camlPervasives__$5e_1112 [93] caml_iterate_global_roots
 [308] camlDigest__entry     [169] camlPervasives__at_exit_1322 [191] caml_leave_blocking_section
 [104] camlDigest__string_1033 [160] camlPervasives__entry [192] caml_leave_blocking_section_default
  [67] camlFilename__entry   [127] camlPervasives__exit_1326 [129] caml_lessequal
 [116] camlFormat__add_queue_1180 [134] camlPervasives__flush_all_1185 [52] caml_lex_engine
 [121] camlFormat__advance_left_1277 [157] camlPervasives__fun_1500 [172] caml_main
 [122] camlFormat__advance_loop_1271 [198] camlPervasives__input_1224 [18] caml_major_collection_slice
 [270] camlFormat__display_newline_1469 [330] camlPervasives__iter_1186 [173] caml_make_free_blocks
 [108] camlFormat__doprn_1625 [143] camlPervasives__max_1025 [31] caml_make_vect
 [118] camlFormat__enqueue_advance_1279 [128] camlPervasives__min_1022 [106] caml_md5_string
 [239] camlFormat__enqueue_string_as_1286 [289] camlPervasives__open_in_1218 [11] caml_minor_collection
 [140] camlFormat__entry     [163] camlPervasives__open_in_gen_1214 [262] caml_ml_flush
 [271] camlFormat__eprintf_1772 [234] camlPervasives__output_1194 [200] caml_ml_input
 [166] camlFormat__format_pp_token_1227 [102] camlPervasives__string_of_int_1130 [159] caml_ml_open_descriptor_in
 [309] camlFormat__formatter_of_buffer_1499 [331] camlPrintexc__entry [165] caml_ml_open_descriptor_out
 [286] camlFormat__formatter_of_out_channel_1497 [279] camlPrintf__ac_of_format_1184 [135] caml_ml_out_channels_list
 [272] camlFormat__fprintf_1766 [332] camlPrintf__entry  [236] caml_ml_output
 [266] camlFormat__fun_2097  [280] camlPrintf__index_of_int_1037 [38] caml_modify
 [273] camlFormat__fun_2645  [281] camlPrintf__iter_on_format_args_1137 [49] caml_notequal
 [274] camlFormat__fun_2653  [282] camlPrintf__kapr_1209 [150] caml_obj_dup
 [275] camlFormat__kfprintf_1760 [283] camlPrintf__scan_fmt_1144 [90] caml_oldify_local_roots
 [276] camlFormat__kpr_1614  [149] camlRandom__entry      [22] caml_oldify_mopup
 [277] camlFormat__kprintf_1610 [222] camlRandom__extract_1046 [23] caml_oldify_one
 [152] camlFormat__make_formatter_1493 [69] camlRandom__full_init_1040 [265] caml_open_descriptor_in
 [278] camlFormat__mkprintf_1607 [68] camlRandom__make_self_init_1058 [293] caml_open_descriptor_out
 [227] camlFormat__peek_queue_1186 [146] camlRandom__new_state_1036 [228] caml_page_table_add
 [158] camlFormat__pp_clear_queue_1196 [333] camlScheduler__entry [346] caml_page_table_initialize
 [164] camlFormat__pp_flush_queue_1351 [84] camlSim_lexer____ocaml_lex_comment_rec_1043 [195] caml_page_table_modify
 [161] camlFormat__pp_make_formatter_1485 [85] camlSim_lexer____ocaml_lex_token_rec_1041 [184] caml_process_pending_signals
 [267] camlFormat__pp_open_box_gen_1312 [206] camlSim_lexer__comment_1042 [1] caml_program
 [240] camlFormat__pp_output_string_1199 [334] camlSim_lexer__entry [237] caml_putblock
 [241] camlFormat__pp_print_as_char_1619 [96] camlSim_lexer__handleNewline_1037 [294] caml_raise
 [112] camlFormat__pp_print_char_1374 [80] camlSim_lexer__read_file_1053 [137] caml_raise_constant
 [156] camlFormat__pp_print_flush_1393 [207] camlSim_lexer__token_1040 [138] caml_raise_not_found
 [131] camlFormat__pp_print_newline_1392 [194] camlString__blit_1056 [347] caml_realloc_ref_table
 [136] camlFormat__pp_rinit_1349 [335] camlString__entry [284] caml_register_custom_operations
 [151] camlFormat__scan_push_1308 [162] camlString__make_1038 [246] caml_register_frametable
 [124] camlFormat__take_queue_1188 [120] camlSys__entry  [295] caml_register_global_root
 [310] camlGraph__entry      [223] caml_MD5Final         [296] caml_register_named_value
  [98] camlHashtbl__add_1074 [224] caml_MD5Init          [253] caml_round_heap_chunk_size
 [115] camlHashtbl__create_1051 [225] caml_MD5Transform  [107] caml_scan_global_roots
 [311] camlHashtbl__entry    [226] caml_MD5Update         [95] caml_scan_global_young_roots
  [15] camlHashtbl__find_1093 [251] caml_add_to_heap     [348] caml_set_minor_heap_size
  [50] camlHashtbl__find_rec_1088 [257] caml_adjust_gc_speed [229] caml_stat_alloc
  [73] camlHashtbl__hash_1031 [248] caml_aligned_malloc  [269] caml_stat_free
  [72] camlHashtbl__insert_bucket_1068 [336] caml_alloc  [201] caml_string_equal
  [16] camlHashtbl__replace_1112 [132] caml_alloc_array   [36] caml_string_length
  [21] camlHashtbl__replace_bucket_1116 [147] caml_alloc_channel [202] caml_string_notequal
  [71] camlHashtbl__resize_1061 [148] caml_alloc_custom  [349] caml_sys_exit
 [312] camlInt32__entry      [249] caml_alloc_for_heap   [125] caml_sys_get_argv
 [313] camlInt64__entry       [29] caml_alloc_shr        [145] caml_sys_get_config
  [43] camlLexing__engine_1090 [35] caml_alloc_small     [139] caml_sys_getenv
 [314] camlLexing__entry      [55] caml_alloc_string     [350] caml_sys_init
 [287] camlLexing__from_channel_1115 [337] caml_alloc_table [175] caml_sys_open
 [141] camlLexing__from_function_1113 [177] caml_apply2  [351] caml_sys_random_seed
 [196] camlLexing__fun_1200  [230] caml_apply3           [209] clear_table
 [197] camlLexing__lex_refill_1100 [180] caml_blit_string [250] clip_heap_chunk_size
  [64] camlLexing__lexeme_1122 [44] caml_c_call           [61] compare_stack_overflow
  [74] camlLexing__new_line_1155 [254] caml_check_urgent_gc [20] compare_val
  [62] camlLexing__sub_lexeme_1126 [245] caml_compact_heap_maybe [247] cons
  [39] camlList__assoc_1169   [17] caml_compare          [285] do_write
 [315] camlList__entry       [290] caml_convert_flag_list [26] hash_aux
  [58] camlList__fold_left_1078 [255] caml_copy_double   [297] hash_value_name
  [99] camlList__iter_1074   [101] caml_copy_string       [24] mark_slice
 [216] camlList__rev_append_1051 [133] caml_copy_string_array [298] norm_heapincr
 [193] camlMain__aux_1122     [56] caml_create_string    [352] norm_minsize
 [109] camlMain__check_power_1126 [233] caml_curry2      [353] norm_pfree
   [3] camlMain__entry       [258] caml_curry2_1         [354] norm_pmax
 [100] camlMain__fun_1160    [256] caml_curry3           [181] parse_digit
 [213] camlMain__fun_1166    [268] caml_curry3_1         [130] parse_format
  [79] camlMain__loadRom_1111 [199] caml_curry3_2         [88] parse_intnat
 [221] camlMain__output_1120 [264] caml_curry4           [186] parse_sign_and_base
   [7] camlMain__run_1133    [231] caml_curry4_1         [263] realloc_gray_vals
   [6] camlMain__simulate_1115 [232] caml_curry4_2       [299] reset_table
 [316] camlMap__Make_1355    [235] caml_curry4_3          [78] start_cycle
  [57] camlMap__add_1108     [338] caml_curry5            [27] sweep_slice
 [179] camlMap__bal_1081      [65] caml_darken           [300] unlink_channel
