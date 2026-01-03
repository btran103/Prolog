
:- dynamic ngan_sach/1.
:- dynamic khoang_cach/1.
:- dynamic phuong_tien/1.


dia_diem(vung_tau, thap, gan, xe_may, 2).
dia_diem(vung_tau, thap, gan, o_to, 2).

dia_diem(da_lat, trung_binh, xa, xe_khach, 8).
dia_diem(da_lat, trung_binh, xa, may_bay, 1).

dia_diem(da_nang, cao, xa, may_bay, 1.5).


goi_y(DiaDiem, ThoiGian) :-
    ngan_sach(NS),
    khoang_cach(KC),
    phuong_tien(PT),
    dia_diem(DiaDiem, NS, KC, PT, ThoiGian).


tu_van :-
    retractall(ngan_sach(_)),
    retractall(khoang_cach(_)),
    retractall(phuong_tien(_)),

    write('--- HE THONG TU VAN DIA DIEM DU LICH ---'), nl,

    write('Nhap ngan sach (thap/trung_binh/cao): '),
    read(NS), assert(ngan_sach(NS)),

    write('Nhap khoang cach (gan/xa): '),
    read(KC), assert(khoang_cach(KC)),

    write('Nhap phuong tien (xe_may/o_to/xe_khach/may_bay): '),
    read(PT), assert(phuong_tien(PT)),

    nl,
    write('Ket qua tu van:'), nl,
    thuc_hien_goi_y.



thuc_hien_goi_y :-
    goi_y(DiaDiem, ThoiGian),
    format('Ban nen di: ~w~n', [DiaDiem]),
    format('Thoi gian di chuyen (gio): ~w', [ThoiGian]),
    !.

thuc_hien_goi_y :-
    write('Rat tiec, khong co dia diem phu hop voi yeu cau cua ban.').
