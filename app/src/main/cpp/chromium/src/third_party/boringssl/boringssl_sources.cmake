set(BORING_SSL_SRC ${BORING_SSL_ASM_SRC}
    err_data.c
    src/crypto/asn1/a_bitstr.c
    src/crypto/asn1/a_bool.c
    src/crypto/asn1/a_d2i_fp.c
    src/crypto/asn1/a_dup.c
    src/crypto/asn1/a_enum.c
    src/crypto/asn1/a_gentm.c
    src/crypto/asn1/a_i2d_fp.c
    src/crypto/asn1/a_int.c
    src/crypto/asn1/a_mbstr.c
    src/crypto/asn1/a_object.c
    src/crypto/asn1/a_octet.c
    src/crypto/asn1/a_print.c
    src/crypto/asn1/a_strnid.c
    src/crypto/asn1/a_time.c
    src/crypto/asn1/a_type.c
    src/crypto/asn1/a_utctm.c
    src/crypto/asn1/a_utf8.c
    src/crypto/asn1/asn1_lib.c
    src/crypto/asn1/asn1_locl.h
    src/crypto/asn1/asn1_par.c
    src/crypto/asn1/asn_pack.c
    src/crypto/asn1/f_enum.c
    src/crypto/asn1/f_int.c
    src/crypto/asn1/f_string.c
    src/crypto/asn1/tasn_dec.c
    src/crypto/asn1/tasn_enc.c
    src/crypto/asn1/tasn_fre.c
    src/crypto/asn1/tasn_new.c
    src/crypto/asn1/tasn_typ.c
    src/crypto/asn1/tasn_utl.c
    src/crypto/asn1/time_support.c
    src/crypto/base64/base64.c
    src/crypto/bio/bio.c
    src/crypto/bio/bio_mem.c
    src/crypto/bio/connect.c
    src/crypto/bio/fd.c
    src/crypto/bio/file.c
    src/crypto/bio/hexdump.c
    src/crypto/bio/internal.h
    src/crypto/bio/pair.c
    src/crypto/bio/printf.c
    src/crypto/bio/socket.c
    src/crypto/bio/socket_helper.c
    src/crypto/bn_extra/bn_asn1.c
    src/crypto/bn_extra/convert.c
    src/crypto/buf/buf.c
    src/crypto/bytestring/asn1_compat.c
    src/crypto/bytestring/ber.c
    src/crypto/bytestring/cbb.c
    src/crypto/bytestring/cbs.c
    src/crypto/bytestring/internal.h
    src/crypto/bytestring/unicode.c
    src/crypto/chacha/chacha.c
    src/crypto/chacha/internal.h
    src/crypto/cipher_extra/cipher_extra.c
    src/crypto/cipher_extra/derive_key.c
    src/crypto/cipher_extra/e_aesccm.c
    src/crypto/cipher_extra/e_aesctrhmac.c
    src/crypto/cipher_extra/e_aesgcmsiv.c
    src/crypto/cipher_extra/e_chacha20poly1305.c
    src/crypto/cipher_extra/e_null.c
    src/crypto/cipher_extra/e_rc2.c
    src/crypto/cipher_extra/e_rc4.c
    src/crypto/cipher_extra/e_tls.c
    src/crypto/cipher_extra/internal.h
    src/crypto/cipher_extra/tls_cbc.c
    src/crypto/cmac/cmac.c
    src/crypto/conf/conf.c
    src/crypto/conf/conf_def.h
    src/crypto/conf/internal.h
    src/crypto/cpu-aarch64-fuchsia.c
    src/crypto/cpu-aarch64-linux.c
    src/crypto/cpu-arm-linux.c
    src/crypto/cpu-arm-linux.h
    src/crypto/cpu-arm.c
    src/crypto/cpu-intel.c
    src/crypto/cpu-ppc64le.c
    src/crypto/crypto.c
    src/crypto/curve25519/spake25519.c
    src/crypto/dh/check.c
    src/crypto/dh/dh.c
    src/crypto/dh/dh_asn1.c
    src/crypto/dh/params.c
    src/crypto/digest_extra/digest_extra.c
    src/crypto/dsa/dsa.c
    src/crypto/dsa/dsa_asn1.c
    src/crypto/ec_extra/ec_asn1.c
    src/crypto/ecdh_extra/ecdh_extra.c
    src/crypto/ecdsa_extra/ecdsa_asn1.c
    src/crypto/engine/engine.c
    src/crypto/err/err.c
    src/crypto/err/internal.h
    src/crypto/evp/digestsign.c
    src/crypto/evp/evp.c
    src/crypto/evp/evp_asn1.c
    src/crypto/evp/evp_ctx.c
    src/crypto/evp/internal.h
    src/crypto/evp/p_dsa_asn1.c
    src/crypto/evp/p_ec.c
    src/crypto/evp/p_ec_asn1.c
    src/crypto/evp/p_ed25519.c
    src/crypto/evp/p_ed25519_asn1.c
    src/crypto/evp/p_rsa.c
    src/crypto/evp/p_rsa_asn1.c
    src/crypto/evp/pbkdf.c
    src/crypto/evp/print.c
    src/crypto/evp/scrypt.c
    src/crypto/evp/sign.c
    src/crypto/ex_data.c
    src/crypto/fipsmodule/aes/internal.h
    src/crypto/fipsmodule/bcm.c
    src/crypto/fipsmodule/bn/internal.h
    src/crypto/fipsmodule/bn/rsaz_exp.h
    src/crypto/fipsmodule/cipher/internal.h
    src/crypto/fipsmodule/delocate.h
    src/crypto/fipsmodule/des/internal.h
    src/crypto/fipsmodule/digest/internal.h
    src/crypto/fipsmodule/digest/md32_common.h
    src/crypto/fipsmodule/ec/internal.h
    src/crypto/fipsmodule/ec/p256-x86_64-table.h
    src/crypto/fipsmodule/ec/p256-x86_64.h
    src/crypto/fipsmodule/is_fips.c
    src/crypto/fipsmodule/md5/internal.h
    src/crypto/fipsmodule/modes/internal.h
    src/crypto/fipsmodule/rand/internal.h
    src/crypto/fipsmodule/rsa/internal.h
    src/crypto/fipsmodule/sha/internal.h
    src/crypto/fipsmodule/tls/internal.h
    src/crypto/hkdf/hkdf.c
    src/crypto/hrss/hrss.c
    src/crypto/hrss/internal.h
    src/crypto/internal.h
    src/crypto/lhash/lhash.c
    src/crypto/mem.c
    src/crypto/obj/obj.c
    src/crypto/obj/obj_dat.h
    src/crypto/obj/obj_xref.c
    src/crypto/pem/pem_all.c
    src/crypto/pem/pem_info.c
    src/crypto/pem/pem_lib.c
    src/crypto/pem/pem_oth.c
    src/crypto/pem/pem_pk8.c
    src/crypto/pem/pem_pkey.c
    src/crypto/pem/pem_x509.c
    src/crypto/pem/pem_xaux.c
    src/crypto/pkcs7/internal.h
    src/crypto/pkcs7/pkcs7.c
    src/crypto/pkcs7/pkcs7_x509.c
    src/crypto/pkcs8/internal.h
    src/crypto/pkcs8/p5_pbev2.c
    src/crypto/pkcs8/pkcs8.c
    src/crypto/pkcs8/pkcs8_x509.c
    src/crypto/poly1305/internal.h
    src/crypto/poly1305/poly1305.c
    src/crypto/poly1305/poly1305_arm.c
    src/crypto/poly1305/poly1305_vec.c
    src/crypto/pool/internal.h
    src/crypto/pool/pool.c
    src/crypto/rand_extra/deterministic.c
    src/crypto/rand_extra/forkunsafe.c
    src/crypto/rand_extra/fuchsia.c
    src/crypto/rand_extra/rand_extra.c
    src/crypto/rand_extra/windows.c
    src/crypto/rc4/rc4.c
    src/crypto/refcount_c11.c
    src/crypto/refcount_lock.c
    src/crypto/rsa_extra/rsa_asn1.c
    src/crypto/rsa_extra/rsa_print.c
    src/crypto/stack/stack.c
    src/crypto/thread.c
    src/crypto/thread_none.c
    src/crypto/thread_pthread.c
    src/crypto/thread_win.c
    src/crypto/x509/a_digest.c
    src/crypto/x509/a_sign.c
    src/crypto/x509/a_strex.c
    src/crypto/x509/a_verify.c
    src/crypto/x509/algorithm.c
    src/crypto/x509/asn1_gen.c
    src/crypto/x509/by_dir.c
    src/crypto/x509/by_file.c
    src/crypto/x509/charmap.h
    src/crypto/x509/i2d_pr.c
    src/crypto/x509/internal.h
    src/crypto/x509/rsa_pss.c
    src/crypto/x509/t_crl.c
    src/crypto/x509/t_req.c
    src/crypto/x509/t_x509.c
    src/crypto/x509/t_x509a.c
    src/crypto/x509/vpm_int.h
    src/crypto/x509/x509.c
    src/crypto/x509/x509_att.c
    src/crypto/x509/x509_cmp.c
    src/crypto/x509/x509_d2.c
    src/crypto/x509/x509_def.c
    src/crypto/x509/x509_ext.c
    src/crypto/x509/x509_lu.c
    src/crypto/x509/x509_obj.c
    src/crypto/x509/x509_r2x.c
    src/crypto/x509/x509_req.c
    src/crypto/x509/x509_set.c
    src/crypto/x509/x509_trs.c
    src/crypto/x509/x509_txt.c
    src/crypto/x509/x509_v3.c
    src/crypto/x509/x509_vfy.c
    src/crypto/x509/x509_vpm.c
    src/crypto/x509/x509cset.c
    src/crypto/x509/x509name.c
    src/crypto/x509/x509rset.c
    src/crypto/x509/x509spki.c
    src/crypto/x509/x_algor.c
    src/crypto/x509/x_all.c
    src/crypto/x509/x_attrib.c
    src/crypto/x509/x_crl.c
    src/crypto/x509/x_exten.c
    src/crypto/x509/x_info.c
    src/crypto/x509/x_name.c
    src/crypto/x509/x_pkey.c
    src/crypto/x509/x_pubkey.c
    src/crypto/x509/x_req.c
    src/crypto/x509/x_sig.c
    src/crypto/x509/x_spki.c
    src/crypto/x509/x_val.c
    src/crypto/x509/x_x509.c
    src/crypto/x509/x_x509a.c
    src/crypto/x509v3/ext_dat.h
    src/crypto/x509v3/internal.h
    src/crypto/x509v3/pcy_cache.c
    src/crypto/x509v3/pcy_data.c
    src/crypto/x509v3/pcy_int.h
    src/crypto/x509v3/pcy_lib.c
    src/crypto/x509v3/pcy_map.c
    src/crypto/x509v3/pcy_node.c
    src/crypto/x509v3/pcy_tree.c
    src/crypto/x509v3/v3_akey.c
    src/crypto/x509v3/v3_akeya.c
    src/crypto/x509v3/v3_alt.c
    src/crypto/x509v3/v3_bcons.c
    src/crypto/x509v3/v3_bitst.c
    src/crypto/x509v3/v3_conf.c
    src/crypto/x509v3/v3_cpols.c
    src/crypto/x509v3/v3_crld.c
    src/crypto/x509v3/v3_enum.c
    src/crypto/x509v3/v3_extku.c
    src/crypto/x509v3/v3_genn.c
    src/crypto/x509v3/v3_ia5.c
    src/crypto/x509v3/v3_info.c
    src/crypto/x509v3/v3_int.c
    src/crypto/x509v3/v3_lib.c
    src/crypto/x509v3/v3_ncons.c
    src/crypto/x509v3/v3_ocsp.c
    src/crypto/x509v3/v3_pci.c
    src/crypto/x509v3/v3_pcia.c
    src/crypto/x509v3/v3_pcons.c
    src/crypto/x509v3/v3_pku.c
    src/crypto/x509v3/v3_pmaps.c
    src/crypto/x509v3/v3_prn.c
    src/crypto/x509v3/v3_purp.c
    src/crypto/x509v3/v3_skey.c
    src/crypto/x509v3/v3_sxnet.c
    src/crypto/x509v3/v3_utl.c
    src/third_party/fiat/curve25519.c
    src/third_party/fiat/curve25519_32.h
    src/third_party/fiat/curve25519_64.h
    src/third_party/fiat/curve25519_tables.h
    src/third_party/fiat/internal.h
    src/third_party/fiat/p256_32.h
    src/third_party/fiat/p256_64.h
    src/third_party/sike/P503.c
    src/third_party/sike/asm/fp_generic.c
    src/third_party/sike/fpx.c
    src/third_party/sike/fpx.h
    src/third_party/sike/isogeny.c
    src/third_party/sike/isogeny.h
    src/third_party/sike/sike.c
    src/third_party/sike/sike.h
    src/third_party/sike/utils.h
    src/ssl/bio_ssl.cc
    src/ssl/d1_both.cc
    src/ssl/d1_lib.cc
    src/ssl/d1_pkt.cc
    src/ssl/d1_srtp.cc
    src/ssl/dtls_method.cc
    src/ssl/dtls_record.cc
    src/ssl/handoff.cc
    src/ssl/handshake.cc
    src/ssl/handshake_client.cc
    src/ssl/handshake_server.cc
    src/ssl/internal.h
    src/ssl/s3_both.cc
    src/ssl/s3_lib.cc
    src/ssl/s3_pkt.cc
    src/ssl/ssl_aead_ctx.cc
    src/ssl/ssl_asn1.cc
    src/ssl/ssl_buffer.cc
    src/ssl/ssl_cert.cc
    src/ssl/ssl_cipher.cc
    src/ssl/ssl_file.cc
    src/ssl/ssl_key_share.cc
    src/ssl/ssl_lib.cc
    src/ssl/ssl_privkey.cc
    src/ssl/ssl_session.cc
    src/ssl/ssl_stat.cc
    src/ssl/ssl_transcript.cc
    src/ssl/ssl_versions.cc
    src/ssl/ssl_x509.cc
    src/ssl/t1_enc.cc
    src/ssl/t1_lib.cc
    src/ssl/tls13_both.cc
    src/ssl/tls13_client.cc
    src/ssl/tls13_enc.cc
    src/ssl/tls13_server.cc
    src/ssl/tls_method.cc
    src/ssl/tls_record.cc)