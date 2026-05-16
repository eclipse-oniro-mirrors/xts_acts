# the minimum version of CMake.
cmake_minimum_required(VERSION 3.5.0)
project(ActsToolChainHapTest)

set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})

if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

add_library(
    entry
    SHARED
    CommonTool.cpp
    __flt_rounds_impl.cpp
    memfill.cpp
    src/common/mtest.c
    src/common/fdfill.c
    src/common/path.c
    napi_init.cpp
    setrlim.cpp
    src/api/main.cpp
    src/eabi/__aeabi_memclr.cpp
    src/eabi/__aeabi_memcpy.cpp
    src/eabi/__aeabi_memmove.cpp
    src/eabi/__aeabi_read_tp.cpp
    src/eabi/__gmtime64.cpp
    src/eabi/__sigtimedwait_time64.cpp
    src/functional/argv.cpp
    src/functional/basename.cpp
    src/functional/clock_gettime.cpp
    src/functional/crypt.cpp
    src/functional/dirname.cpp
    src/functional/env.cpp
    src/functional/fnmatch.cpp
    src/functional/pthread_gettid_np.cpp
    src/functional/sched_cpualloc.cpp
    src/functional/sched_setscheduler.cpp
     src/functional/search_insque.cpp
     src/functional/search_lsearch.cpp
     src/functional/search_tsearch.cpp
     src/functional/setjmp.cpp
     src/functional/clocale_mbfuncs.cpp
     src/functional/dl_multithread_lock.cpp
     src/functional/dl_multithread_test.cpp
     src/functional/fdopen.cpp
     src/functional/fcntl.cpp
     src/functional/fopencookie_test.cpp
     src/functional/inet_pton.cpp
     src/functional/pthread_cond.cpp
     src/functional/pthread_mutex.cpp
     src/functional/pthread_mutex_pi.cpp
     src/functional/pthread_tsd.cpp
     src/functional/sem_init.cpp
     src/functional/snprintf.cpp
     src/functional/sscanf.cpp
     src/functional/string.cpp
     src/functional/string_memmem.cpp
     src/functional/string_memset.cpp
     src/functional/strtod.cpp
     src/functional/strtof.cpp
     src/functional/swprintf.cpp
     src/functional/time.cpp
     src/functional/tls_align.cpp
     src/functional/tls_align_dlopen.cpp
     src/functional/tls_init_dlopen.cpp
     src/functional/tls_local_exec.cpp
    src/functional/sscanf_long.cpp
    src/functional/string_memcpy.cpp
    src/functional/string_strcspn.cpp
    src/functional/strtod_long.cpp
    src/functional/strtod_simple.cpp
    src/functional/tgkill.cpp
    src/functional/tls_init.cpp
    src/functional/atexit_dlclose.cpp
    src/functional/dlclose_reset.cpp
    src/functionalext/fortify/poll.cpp
    src/functionalext/info/application_target_sdk_version_test.cpp
    src/functionalext/info/device_api_version.cpp
    src/functionalext/locale/iconv.cpp
    src/functionalext/locale/langinfo.cpp
    src/functionalext/supplement/conf/get_avphys_pages.cpp
    src/functionalext/supplement/conf/get_nprocs.cpp
    src/functionalext/supplement/conf/get_phys_pages.cpp
    src/functionalext/supplement/ctype/__ctype_get_mb_cur_max.cpp
    src/functionalext/supplement/exit/at_quick_exit.cpp
    src/functionalext/supplement/exit/atexit.cpp
    src/functionalext/supplement/exit/a_cxa_atexit.cpp
    src/functionalext/supplement/exit/double_exit.cpp
    src/functionalext/supplement/fenv/__flt_rounds.cpp
    src/functionalext/supplement/legacy/ftw.cpp
    src/functionalext/supplement/legacy/getdtablesize.cpp
    src/functionalext/supplement/legacy/verr.cpp
    src/functionalext/supplement/legacy/verrx.cpp
    src/functionalext/supplement/legacy/vwarn.cpp
    src/functionalext/supplement/legacy/vwarnx.cpp
    src/functionalext/supplement/linux/brk.cpp
    src/functionalext/supplement/linux/capget.cpp
    src/functionalext/supplement/linux/clone.cpp
    src/functionalext/supplement/linux/copy_file_range.cpp
    src/functionalext/supplement/linux/sendfile.cpp
    src/functionalext/supplement/linux/epoll_create.cpp
    src/functionalext/supplement/linux/epoll_create1.cpp
    src/functionalext/supplement/linux/epoll_ctl.cpp
    src/functionalext/supplement/linux/epoll_pwait.cpp
    src/functionalext/supplement/linux/epoll_wait.cpp
    src/functionalext/supplement/linux/eventfd.cpp
    src/functionalext/supplement/linux/eventfd_read.cpp
    src/functionalext/supplement/linux/eventfd_write.cpp
    src/functionalext/supplement/linux/flistxattr.cpp
    src/functionalext/supplement/linux/fremovexattr.cpp
    src/functionalext/supplement/linux/fsetxattr.cpp
    src/functionalext/supplement/linux/getdents.cpp
    src/functionalext/supplement/linux/name_to_handle_at.cpp
    src/functionalext/supplement/linux/process_vm.cpp
    src/functionalext/supplement/linux/readahead.cpp
    src/functionalext/supplement/locale/duplocale_sup.cpp
    src/functionalext/supplement/malloc/aligned_alloc.cpp
    src/functionalext/supplement/math/__fpclassifyf.cpp
    src/functionalext/supplement/math/__fpclassifyl.cpp
    src/functionalext/supplement/math/__signbitf.cpp
    src/functionalext/supplement/math/__signbitl.cpp
    src/functionalext/supplement/misc/issetugid.cpp
    src/functionalext/supplement/misc/setpriority.cpp
    src/functionalext/supplement/multibyte/c16rtomb.cpp
    src/functionalext/supplement/multibyte/c32rtomb.cpp
    src/functionalext/supplement/network/__h_errno_location.cpp
    src/functionalext/supplement/network/__recvmmsg_time64.cpp
    src/functionalext/supplement/network/dn_comp.cpp
    src/functionalext/supplement/network/dn_skipname.cpp
    src/functionalext/supplement/prng/drand48.cpp
    src/functionalext/supplement/prng/erand48.cpp
    src/functionalext/supplement/process/execl.cpp
    src/functionalext/supplement/sched/__sched_cpucount.cpp
    src/functionalext/supplement/sched/sched_getcpu.cpp
    src/functionalext/supplement/setjmp/_longjmp.cpp
    src/functionalext/supplement/setjmp/_setjmp.cpp
    src/functionalext/supplement/signal/__libc_current_sigrtmax.cpp
    src/functionalext/supplement/signal/__libc_current_sigrtmin.cpp
    src/functionalext/supplement/signal/__getitimer_time64.cpp
    src/functionalext/supplement/signal/__setitimer_time64.cpp
    src/functionalext/supplement/signal/sigpending.cpp
    src/functionalext/supplement/stdio/__fbufsize.cpp
    src/functionalext/supplement/stdio/__flbf.cpp
    src/functionalext/supplement/stdio/clearerr.cpp
    src/functionalext/supplement/stdlib/abs.cpp
    src/functionalext/supplement/stdlib/atof.cpp
    src/functionalext/supplement/stdlib/atoi.cpp
    src/functionalext/supplement/stdlib/atoll.cpp
    src/functionalext/supplement/stdlib/bsearch.cpp
    src/functionalext/supplement/string/bzero.cpp
    src/functionalext/supplement/termios/cfgetispeed.cpp
    src/functionalext/supplement/termios/cfgetospeed.cpp
    src/functionalext/supplement/termios/cfmakeraw.cpp
    src/functionalext/supplement/termios/cfsetispeed.cpp
    src/functionalext/supplement/termios/cfsetospeed.cpp
    src/functionalext/supplement/thread/cnd_init.cpp
    src/functionalext/supplement/thread/cnd_signal.cpp
    src/functionalext/supplement/thread/cnd_broadcast.cpp
    src/functionalext/supplement/thread/cnd_timedwait.cpp
    src/functionalext/supplement/thread/cnd_wait.cpp
    src/functionalext/supplement/lock_info/pthread_internal_lock_info.cpp
    src/functionalext/supplement/time/clock.cpp
    src/functionalext/supplement/time/clock_getcpuclockid.cpp
    src/functionalext/supplement/time/clock_getres.cpp
    src/functionalext/supplement/time/difftime_sup.cpp
    src/functionalext/supplement/time/gmtime_r_sup.cpp
    src/functionalext/supplement/time/gmtime_sup.cpp
    src/functionalext/supplement/time/nanosleep.cpp
    src/functionalext/supplement/time/timer_create.cpp
    src/functionalext/supplement/time/timer_getoverrun.cpp
    src/functionalext/supplement/time/timer_gettime.cpp
    src/functionalext/supplement/time/timer_settime.cpp
    src/functionalext/supplement/time/timespec_get.cpp
    src/functionalext/supplement/time/utime_sup.cpp
    src/functionalext/supplement/time/wcsftime.cpp
    src/functionalext/supplement/unistd/alarm.cpp
    src/functionalext/supplement/unistd/chdir.cpp
    src/functionalext/supplement/unistd/ctermid.cpp
    src/functionalext/supplement/unistd/gethostname.cpp
    src/functionalext/supplement/unistd/setpgrp.cpp
    src/functionalext/time/ctime.cpp
    src/functionalext/time/ctime_r.cpp
    src/math/acos.cpp
    src/math/acosh.cpp
    src/math/acoshf.cpp
    src/math/acosl.cpp
    src/math/asin.cpp
    src/math/asinf.cpp
    src/math/asinh.cpp
    src/math/asinhf.cpp
    src/math/asinl.cpp
    src/math/atan.cpp
    src/math/atan2.cpp
    src/math/atan2f.cpp
    src/math/atan2l.cpp
    src/math/atanf.cpp
    src/math/atanh.cpp
    src/math/atanhf.cpp
    src/math/atanhl.cpp
    src/math/atanl.cpp
    src/math/cbrt.cpp
    src/math/cbrtf.cpp
    src/math/cbrtl.cpp
    src/math/ceil.cpp
    src/math/ceilf.cpp
    src/math/ceill.cpp
    src/math/copysign.cpp
    src/math/copysignf.cpp
    src/math/copysignl.cpp
    src/math/cos.cpp
    src/math/cosf.cpp
    src/math/cosh.cpp
    src/math/coshf.cpp
    src/math/coshl.cpp
    src/math/cosl.cpp
    src/math/drem.cpp
    src/math/dremf.cpp
    src/math/erf.cpp
    src/math/erfc.cpp
    src/math/erfcf.cpp
    src/math/erff.cpp
    src/math/erfl.cpp
     src/math/acosf.cpp
     src/math/exp10.cpp
     src/math/exp10f.cpp
     src/math/exp10l.cpp
     src/math/fdim.cpp
    src/math/fdimf.cpp
    src/math/log1p.cpp
    src/math/log1pf.cpp
    src/math/fmin.cpp
     src/math/fminf.cpp
     src/math/fminl.cpp
     src/math/fmod.cpp
     src/math/fmodf.cpp
     src/math/fmodl.cpp
     src/math/j0.cpp
     src/math/j0f.cpp
     src/math/j1.cpp
     src/math/jn.cpp
     src/math/jnf.cpp
     src/math/ldexp.cpp
     src/math/ldexpf.cpp
     src/math/ldexpl.cpp
     src/math/lgamma.cpp
     src/math/lgamma_r.cpp
     src/math/lgammaf.cpp
     src/math/lgammaf_r.cpp
     src/math/lgammal_r.cpp
     src/math/llrint.cpp
     src/math/llrintf.cpp
     src/math/llrintl.cpp
     src/math/llround.cpp
     src/math/llroundf.cpp
     src/math/llroundl.cpp
     src/math/log.cpp
     src/math/log10.cpp
     src/math/log10f.cpp
     src/math/log10l.cpp
     src/math/log1pl.cpp
     src/math/log2.cpp
     src/math/log2f.cpp
     src/math/log2l.cpp
     src/math/logb.cpp
     src/math/logbf.cpp
     src/math/logbl.cpp
     src/math/logf.cpp
     src/math/logl.cpp
     src/math/lrint.cpp
     src/math/lrintf.cpp
     src/math/lrintl.cpp
     src/math/lround.cpp
     src/math/lroundf.cpp
     src/math/lroundl.cpp
     src/math/modf.cpp
     src/math/modff.cpp
     src/math/modfl.cpp
     src/math/nextafter.cpp
     src/math/nextafterf.cpp
     src/math/nextafterl.cpp
     src/math/pow.cpp
     src/math/pow10.cpp
     src/math/pow10f.cpp
     src/math/pow10l.cpp
     src/math/powf.cpp
     src/math/powl.cpp
     src/math/remainder.cpp
     src/math/remainderf.cpp
     src/math/remainderl.cpp
     src/math/remquo.cpp
     src/math/remquof.cpp
     src/math/remquol.cpp
     src/math/round.cpp
     src/math/roundf.cpp
     src/math/roundl.cpp
     src/math/scalb.cpp
     src/math/scalbf.cpp
     src/math/scalbln.cpp
     src/math/scalblnf.cpp
     src/math/scalblnl.cpp
     src/math/scalbn.cpp
     src/math/scalbnf.cpp
     src/math/scalbnl.cpp
     src/math/sin.cpp
     src/math/sincos.cpp
     src/math/sincosf.cpp
     src/math/sincosl.cpp
     src/math/sinf.cpp
     src/math/sinh.cpp
     src/math/sinhf.cpp
     src/math/sinhl.cpp
     src/math/sinl.cpp
     src/math/tan.cpp
     src/math/tanf.cpp
     src/math/tanh.cpp
     src/math/tanhf.cpp
     src/math/tanhl.cpp
     src/math/tanl.cpp
     src/math/trunc.cpp
     src/math/truncf.cpp
     src/math/truncl.cpp
    src/math/tgamma.cpp
    src/math/tgammaf.cpp
    src/math/y0.cpp
    src/math/y0f.cpp
    src/math/y1.cpp
     src/math/y1f.cpp
     src/math/yn.cpp
     src/math/ynf.cpp
    src/regression/daemon-failure.cpp
    src/regression/dn_expand-empty.cpp
    src/regression/dn_expand-ptr-0.cpp
    src/regression/fgets-eof.cpp
    src/regression/fgetwc-buffering.cpp
    src/regression/getpwnam_r-crash.cpp
    src/regression/getpwnam_r-errno.cpp
    src/regression/inet_ntop-v4mapped.cpp
    src/regression/inet_pton-empty-last-field.cpp
    src/regression/iswspace-null.cpp
    src/regression/lrand48-signextend.cpp
    src/regression/malloc-0.cpp
    src/regression/malloc-pressure.cpp
    src/regression/mbsrtowcs-overflow.cpp
    src/regression/memmem-oob-read.cpp
    src/regression/memmem-oob.cpp
    src/regression/mkdtemp-failure.cpp
    src/regression/mkstemp-failure.cpp
    src/regression/printf-1e9-oob.cpp
    src/regression/printf-fmt-g-round.cpp
    src/regression/printf-fmt-g-zeros.cpp
    src/regression/printf-fmt-n.cpp
    src/regression/pthread_exit-cancel.cpp
    src/regression/putenv-doublefree.cpp
    src/regression/regex-backref-0.cpp
    src/regression/regex-bracket-icase.cpp
    src/regression/regex-ere-backref.cpp
    src/regression/regex-escaped-high-byte.cpp
    src/regression/regex-negated-range.cpp
    src/regression/regexec-nosub.cpp
    src/regression/rewind-clear-error.cpp
    src/regression/rlimit-open-files.cpp
    src/regression/scanf-bytes-consumed.cpp
    src/regression/scanf-match-literal-eof.cpp
    src/regression/scanf-nullbyte-char.cpp
    src/regression/setvbuf-unget.cpp
    src/regression/sigprocmask-internal.cpp
    src/regression/sigreturn.cpp
    src/regression/sscanf-eof.cpp
    src/regression/strverscmp.cpp
    src/regression/syscall-sign-extend.cpp
    src/regression/uselocale-0.cpp
    src/regression/wcsncpy-read-overflow.cpp
    src/regression/wcsstr-false-negative.cpp
    strverscmp_impl.cpp
    print.cpp
    time64_functions.cpp
    src/functional/iconv_open.cpp
    src/functional/iconv_test.cpp
    src/functional/iconv_joint_icu_test.cpp
    src/functional/mbc.cpp
    src/functional/pthread_getname_np.cpp
    src/functional/search_hsearch.cpp
    src/functional/strftime.cpp
    src/functional/string_strstr.cpp
    src/functional/strptime.cpp
    src/functional/strtol.cpp
    src/functional/strtold.cpp
    src/functional/udiv.cpp
    src/functional/wcsstr.cpp
    src/functional/wcstol.cpp
    src/functional/qsort.cpp
    src/functional/renameat2_test.cpp
    src/functional/socket.cpp
    src/functional/string_strchr.cpp
    src/functional/tgmath.cpp
    src/functionalext/backtrace/unittest_backtrace.cpp
    src/functionalext/dl_different_hash/dl_different_hash_exe.cpp
    src/functionalext/dl_different_hash/gnu_hash_file.cpp
    src/functionalext/dl_different_hash/sysv_hash_file.cpp
    src/functionalext/fortify/invalid_param_b.cpp
    src/functionalext/fortify/invalid_param.cpp
    src/functionalext/fortify/pthread_fortify_test.cpp
    src/functionalext/fortify/select_test.cpp
    src/functionalext/ldso_cfi/large_size_library/large_size_test.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_1.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_10.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_11.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_12.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_13.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_14.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_15.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_16.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_2.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_3.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_4.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_5.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_6.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_7.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_8.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_9.cpp
    src/functionalext/locale/localeconv.cpp
    src/functionalext/locale/localeconv_multithread.cpp
    src/functionalext/locale/duplocale.cpp
    src/functionalext/locale/newlocale.cpp
    src/functionalext/locale/setlocale.cpp
    src/functionalext/locale/strtod_l.cpp
    src/functionalext/locale/uselocale.cpp
    src/functionalext/locale/wcstod_l.cpp
    src/functionalext/ohos_dfx_log/ohos_dfx_log.cpp
    src/functionalext/queue/sys_queue.cpp
    src/functionalext/sched/sched_getparam.cpp
    src/functionalext/sched/sched_scheduler.cpp
    src/functionalext/string/strlen_test.cpp
    src/functionalext/symver/reloc_symver.cpp
    src/functionalext/symver/dlsym.cpp
    src/functionalext/symver/dlvsym.cpp
    src/functionalext/symver/dynlink.cpp
    src/functionalext/symver/dso_symver.c
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_1.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_2.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_3.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_4.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_5.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_6.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_7.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_8.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_9.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_10.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_11.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_12.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_13.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_14.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_15.cpp
    src/functionalext/ldso_dlopen_config_abs_path/ldso_dlopen_config_abs_path_16.cpp
    src/functionalext/supplement/conf/fpathconf.cpp
    src/functionalext/supplement/conf/pathconf.cpp
    src/functionalext/supplement/conf/sysconf.cpp
    src/functionalext/supplement/ctype/isalnum.cpp
    src/functionalext/supplement/ctype/isalpha.cpp
    src/functionalext/supplement/ctype/isascii.cpp
    src/functionalext/supplement/ctype/isblank.cpp
    src/functionalext/supplement/ctype/iscntrl.cpp
    src/functionalext/supplement/ctype/isdigit.cpp
    src/functionalext/supplement/ctype/isgraph.cpp
    src/functionalext/supplement/ctype/islower.cpp
    src/functionalext/supplement/ctype/isprint.cpp
    src/functionalext/supplement/ctype/ispunct.cpp
    src/functionalext/supplement/ctype/isspace.cpp
    src/functionalext/supplement/ctype/isupper.cpp
    src/functionalext/supplement/ctype/iswalhpa.cpp
    src/functionalext/supplement/ctype/iswalnum.cpp
    src/functionalext/supplement/ctype/iswctype.cpp
    src/functionalext/supplement/ctype/iswalpha.cpp
    src/functionalext/supplement/ctype/iswblank.cpp
    src/functionalext/supplement/ctype/iswcntrl.cpp
    src/functionalext/supplement/ctype/iswdigit.cpp
    src/functionalext/supplement/ctype/iswlower.cpp
    src/functionalext/supplement/ctype/iswprint.cpp
    src/functionalext/supplement/ctype/iswpunct.cpp
    src/functionalext/supplement/ctype/iswspace.cpp
    src/functionalext/supplement/ctype/iswupper.cpp
    src/functionalext/supplement/ctype/iswxdigit.cpp
    src/functionalext/supplement/ctype/isxdigit.cpp
    src/functionalext/supplement/ctype/towlower.cpp
    src/functionalext/supplement/ctype/towupper.cpp
    src/functionalext/supplement/ctype/towupper_l.cpp
    src/functionalext/supplement/ctype/toascii.cpp
    src/functionalext/supplement/ctype/towctrans.cpp
    src/functionalext/supplement/ctype/wcswidth.cpp
    src/functionalext/supplement/ctype/wctrans.cpp
    src/functionalext/supplement/ctype/wctype.cpp
    src/functionalext/supplement/ctype/wcwidth.cpp
    src/functionalext/supplement/dirent/readdir.cpp
    src/functionalext/supplement/dirent/alphasort.cpp
    src/functionalext/supplement/dirent/fdopendir.cpp
    src/functionalext/supplement/dirent/opendir.cpp
    src/functionalext/supplement/dirent/rewinddir.cpp
    src/functionalext/supplement/dirent/seekdir.cpp
    src/functionalext/supplement/dirent/telldir.cpp
    src/functionalext/supplement/ipc/semtimedop.cpp
    src/functionalext/supplement/env/putenv.cpp
    src/functionalext/supplement/errno/__errno_location.cpp
    src/functionalext/supplement/errno/strerror.cpp
    src/functionalext/supplement/exit/quick_exit.cpp
    src/functionalext/supplement/fcntl/creat.cpp
    src/functionalext/supplement/fcntl/open.cpp
    src/functionalext/supplement/fcntl/openat.cpp
    src/functionalext/supplement/fenv/feholdexcept.cpp
    src/functionalext/supplement/legacy/getloadavg.cpp
    src/functionalext/supplement/linux/fanotify_init.cpp
    src/functionalext/supplement/linux/getrandom.cpp
    src/functionalext/supplement/linux/inotify_init1.cpp
    src/functionalext/supplement/linux/memfd_create.cpp
    src/functionalext/supplement/linux/mlock2.cpp
    src/functionalext/supplement/linux/personality.cpp
    src/functionalext/supplement/linux/prctl.cpp
    src/functionalext/supplement/linux/prlimit.cpp
    src/functionalext/supplement/linux/quotactl.cpp
    src/functionalext/supplement/linux/setfsgid.cpp
    src/functionalext/supplement/linux/setfsuid.cpp
    src/functionalext/supplement/linux/remap_file_pages.cpp
    src/functionalext/supplement/linux/removexattr.cpp
    src/functionalext/supplement/linux/sbrk.cpp
    src/functionalext/supplement/linux/setxattr.cpp
    src/functionalext/supplement/linux/swapoff.cpp
    src/functionalext/supplement/linux/swapon.cpp
    src/functionalext/supplement/linux/tee.cpp
    src/functionalext/supplement/linux/signalfd.cpp
    src/functionalext/supplement/linux/sysinfo.cpp
    src/functionalext/supplement/linux/timerfd_create.cpp
    src/functionalext/supplement/linux/timerfd_gettime.cpp
    src/functionalext/supplement/linux/timerfd_settime.cpp
    src/functionalext/supplement/linux/vmsplice.cpp
    src/functionalext/supplement/locale/langinfo_sup.cpp
    src/functionalext/supplement/locale/localeconv_sup.cpp
    src/functionalext/supplement/locale/newlocale_sup.cpp
    src/functionalext/supplement/locale/setlocale_sup.cpp
    src/functionalext/supplement/locale/uselocale_sup.cpp
    src/functionalext/supplement/locale/wcscoll.cpp
    src/functionalext/supplement/locale/wcsxfrm.cpp
    src/functionalext/supplement/malloc/malloc_check_from_ptr.cpp
    src/functionalext/supplement/malloc/malloc_usable_size.cpp
    src/functionalext/supplement/malloc/memalign.cpp
    src/functionalext/supplement/malloc/posix_memalign.cpp
    src/functionalext/supplement/malloc/realloc.cpp
    src/functionalext/supplement/manual/network/gethostbyaddr.cpp
    src/functionalext/supplement/manual/network/gethostbyaddr_r.cpp
    src/functionalext/supplement/manual/network/gethostbyname2.cpp
    src/functionalext/supplement/manual/network/gethostbyname2_r.cpp
    src/functionalext/supplement/manual/network/gethostbyname_r.cpp
    src/functionalext/supplement/manual/network/getnameinfo.cpp
    src/functionalext/supplement/math/finitef.cpp
    src/functionalext/supplement/math/nan.cpp
    src/functionalext/supplement/math/nanf.cpp
    src/functionalext/supplement/math/nanl.cpp
    src/functionalext/supplement/math/rint_ext.cpp
    src/functionalext/supplement/math/significand.cpp
    src/functionalext/supplement/math/significandf.cpp
    src/functionalext/supplement/mbrlen/mbrlen.cpp
    src/functionalext/supplement/misc/ffs.cpp
    src/functionalext/supplement/misc/ffsl.cpp
    src/functionalext/supplement/misc/ffsll.cpp
    src/functionalext/supplement/misc/getauxval.cpp
    src/functionalext/supplement/misc/getdomainname.cpp
    src/functionalext/supplement/misc/getentropy.cpp
    src/functionalext/supplement/misc/getopt.cpp
    src/functionalext/supplement/misc/getopt_long.cpp
    src/functionalext/supplement/misc/getopt_long_only.cpp
    src/functionalext/supplement/misc/getresuid.cpp
    src/functionalext/supplement/misc/getrlimit.cpp
    src/functionalext/supplement/misc/getsubopt.cpp
    src/functionalext/supplement/misc/hasmntopt.cpp
    src/functionalext/supplement/misc/login_tty.cpp
    src/functionalext/supplement/misc/ptsname.cpp
    src/functionalext/supplement/misc/realpath.cpp
    src/functionalext/supplement/misc/setlogmask.cpp
    src/functionalext/supplement/misc/uname.cpp
    src/functionalext/supplement/mman/mlock.cpp
    src/functionalext/supplement/mman/mprotect.cpp
    src/functionalext/supplement/mman/munlock.cpp
    src/functionalext/supplement/multibyte/mblen.cpp
    src/functionalext/supplement/multibyte/mbrtoc16.cpp
    src/functionalext/supplement/multibyte/mbrtoc32.cpp
    src/functionalext/supplement/multibyte/mbsinit.cpp
    src/functionalext/supplement/multibyte/mbsnrtowcs.cpp
    src/functionalext/supplement/multibyte/mbstowcs.cpp
    src/functionalext/supplement/multibyte/mbtowc.cpp
    src/functionalext/supplement/multibyte/wcsrtombs.cpp
    src/functionalext/supplement/multibyte/wcstombs.cpp
    src/functionalext/supplement/multibyte/wctob.cpp
    src/functionalext/supplement/multibyte/wcsnrtombs.cpp
    src/functionalext/supplement/multibyte/wctomb.cpp
    src/functionalext/supplement/network/freeaddrinfo.cpp
    src/functionalext/supplement/network/freeifaddrs.cpp
    src/functionalext/supplement/network/gai_strerror.cpp
    src/functionalext/supplement/network/gethostent.cpp
    src/functionalext/supplement/network/getifaddrs.cpp
    src/functionalext/supplement/network/getnetent.cpp
    src/functionalext/supplement/network/getservbyname.cpp
    src/functionalext/supplement/network/getservbyport.cpp
    src/functionalext/supplement/network/hstrerror.cpp
    src/functionalext/supplement/network/htonl.cpp
    src/functionalext/supplement/network/htons.cpp
    src/functionalext/supplement/network/if_indextoname.cpp
    src/functionalext/supplement/network/if_nameindex.cpp
    src/functionalext/supplement/network/inet_addr.cpp
    src/functionalext/supplement/network/inet_aton.cpp
    src/functionalext/supplement/network/inet_lnaof.cpp
    src/functionalext/supplement/network/inet_ntop.cpp
    src/functionalext/supplement/network/inet_makeaddr.cpp
    src/functionalext/supplement/network/inet_netof.cpp
    src/functionalext/supplement/network/inet_network.cpp
    src/functionalext/supplement/network/inet_ntoa.cpp
    src/functionalext/supplement/network/proto.cpp
    src/functionalext/supplement/network/res_mkquery.cpp
    src/functionalext/supplement/network/res_query.cpp
    src/functionalext/supplement/network/res_querydomain.cpp
    src/functionalext/supplement/network/sendmsg.cpp
    src/functionalext/supplement/network/sendmmsg.cpp
    src/functionalext/supplement/network/setprotoent.cpp
    src/functionalext/supplement/network/socketpair.cpp
    src/functionalext/supplement/passwd/getgrent.cpp
    src/functionalext/supplement/passwd/getgrgid.cpp
    src/functionalext/supplement/passwd/getgrgid_r.cpp
    src/functionalext/supplement/passwd/getgrnam.cpp
    src/functionalext/supplement/passwd/getgrnam_r.cpp
    src/functionalext/supplement/passwd/getgrouplist.cpp
    src/functionalext/supplement/passwd/setgrent.cpp
    src/functionalext/supplement/passwd/setpwent.cpp
    src/functionalext/supplement/prng/lcong48.cpp
    src/functionalext/supplement/prng/lrand48.cpp
    src/functionalext/supplement/prng/mrand48.cpp
    src/functionalext/supplement/prng/rand.cpp
    src/functionalext/supplement/prng/rand_r.cpp
    src/functionalext/supplement/prng/seed48.cpp
    src/functionalext/supplement/prng/srand.cpp
    src/functionalext/supplement/prng/srand48.cpp
    src/functionalext/supplement/process/fexecve.cpp
    src/functionalext/supplement/process/fexecverely.cpp
    src/functionalext/supplement/process/fork.cpp
    src/functionalext/supplement/process/posix_spawn.cpp
    src/functionalext/supplement/process/posix_spawnattr_getflags.cpp
    src/functionalext/supplement/process/posix_spawnattr_getpgroup.cpp
    src/functionalext/supplement/process/posix_spawnattr_getsigdefault.cpp
    src/functionalext/supplement/process/posix_spawnattr_getsigmask.cpp
    src/functionalext/supplement/process/posix_spawnattr_setflags.cpp
    src/functionalext/supplement/process/posix_spawnattr_setpgroup.cpp
    src/functionalext/supplement/process/posix_spawnattr_setsigdefault.cpp
    src/functionalext/supplement/process/posix_spawnattr_setsigmask.cpp
    src/functionalext/supplement/process/posix_spawnp.cpp
    src/functionalext/supplement/process/waitid.cpp
    src/functionalext/supplement/regex/regexec.cpp
    src/functionalext/supplement/sched/sched_getaffinity.cpp
    src/functionalext/supplement/sched/sched_rr_get_interval.cpp
    src/functionalext/supplement/sched/sched_setaffinity.cpp
    src/functionalext/supplement/sched/sched_yield.cpp
    src/functionalext/supplement/search/hcreate_r.cpp
    src/functionalext/supplement/search/hdestroy.cpp
    src/functionalext/supplement/search/hsearch_r.cpp
    src/functionalext/supplement/search/lfind.cpp
    src/functionalext/supplement/search/tdestroy.cpp
    src/functionalext/supplement/select/pselect.cpp
    src/functionalext/supplement/signal/getitimer.cpp
    src/functionalext/supplement/signal/kill.cpp
    src/functionalext/supplement/signal/setitimer.cpp
    src/functionalext/supplement/signal/killpg.cpp
    src/functionalext/supplement/signal/psiginfo.cpp
    src/functionalext/supplement/signal/psignal.cpp
    src/functionalext/supplement/signal/sigaction.cpp
    src/functionalext/supplement/signal/sigignore.cpp
    src/functionalext/supplement/signal/sigqueue.cpp
    src/functionalext/supplement/signal/sighold.cpp
    src/functionalext/supplement/signal/sigpause.cpp
    src/functionalext/supplement/signal/sigrelse.cpp
    src/functionalext/supplement/signal/sigset.cpp
    src/functionalext/supplement/signal/sigsuspend.cpp
    src/functionalext/supplement/signal/sigwait.cpp
    src/functionalext/supplement/signal/sigwaitinfo.cpp
    src/functionalext/supplement/stat/umask.cpp
    src/functionalext/supplement/stdio/fflush.cpp
    src/functionalext/supplement/stdio/__fpending.cpp
    src/functionalext/supplement/stdio/__fpurge.cpp
    src/functionalext/supplement/stdio/__freadable.cpp
    src/functionalext/supplement/stdio/__freading.cpp
    src/functionalext/supplement/stdio/__fseterr.cpp
    src/functionalext/supplement/stdio/__fwritable.cpp
    src/functionalext/supplement/stdio/__fwriting.cpp
    src/functionalext/supplement/stdio/_flushlbf.cpp
    src/functionalext/supplement/stdio/asprintf.cpp
    src/functionalext/supplement/stdio/dprintf.cpp
    src/functionalext/supplement/stdio/fgetln.cpp
    src/functionalext/supplement/stdio/fgetpos.cpp
    src/functionalext/supplement/stdio/fgets.cpp
    src/functionalext/supplement/stdio/fgetws.cpp
    src/functionalext/supplement/stdio/flockfile.cpp
    src/functionalext/supplement/stdio/fprintf.cpp
    src/functionalext/supplement/stdio/fputc.cpp
    src/functionalext/supplement/stdio/fputs.cpp
    src/functionalext/supplement/stdio/fputwc.cpp
    src/functionalext/supplement/stdio/fputws.cpp
    src/functionalext/supplement/stdio/freopen.cpp
    src/functionalext/supplement/stdio/fseeko.cpp
    src/functionalext/supplement/stdio/fsetpos.cpp
    src/functionalext/supplement/stdio/ftell.cpp
    src/functionalext/supplement/stdio/ftrylockfile.cpp
    src/functionalext/supplement/stdio/funlockfile.cpp
    src/functionalext/supplement/stdio/fwide.cpp
    src/functionalext/supplement/stdio/fwprintf.cpp
    src/functionalext/supplement/stdio/fwrite.cpp
    src/functionalext/supplement/unistd/write.cpp
    src/functionalext/supplement/stdio/getc.cpp
    src/functionalext/supplement/stdio/getc_unlocked.cpp
    src/functionalext/supplement/stdio/getchar.cpp
    src/functionalext/supplement/stdio/getchar_unlocked.cpp
    src/functionalext/supplement/stdio/getdelim.cpp
    src/functionalext/supplement/stdio/getline.cpp
    src/functionalext/supplement/stdio/getwc.cpp
    src/functionalext/supplement/stdio/putw.cpp
    src/functionalext/supplement/stdio/remove.cpp
    src/functionalext/supplement/stdio/rename.cpp
    src/functionalext/supplement/stdio/rewind.cpp
    src/functionalext/supplement/stdio/setbuf.cpp
    src/functionalext/supplement/stdio/setbuffer.cpp
    src/functionalext/supplement/stdio/setlinebuf.cpp
    src/functionalext/supplement/stdio/setvbuf.cpp
    src/functionalext/supplement/stdio/ungetwc.cpp
    src/functionalext/supplement/stdio/vdprintf.cpp
    src/functionalext/supplement/stdio/vfprintf.cpp
    src/functionalext/supplement/stdio/vfscanf.cpp
    src/functionalext/supplement/stdio/vfwprintf.cpp
    src/functionalext/supplement/stdio/vfwscanf.cpp
    src/functionalext/supplement/stdio/open_wmemstream.cpp
    src/functionalext/supplement/stdio/printf.cpp
    src/functionalext/supplement/stdio/putc_unlocked.cpp
    src/functionalext/supplement/stdio/putchar.cpp
    src/functionalext/supplement/stdio/putchar_unlocked.cpp
    src/functionalext/supplement/stdio/puts.cpp
    src/functionalext/supplement/stdio/putwchar.cpp
    src/functionalext/supplement/stdio/sprintf.cpp
    src/functionalext/supplement/stdio/swscanf.cpp
    src/functionalext/supplement/stdio/tempnam.cpp
    src/functionalext/supplement/stdio/tmpnam.cpp
    src/functionalext/supplement/stdio/vasprintf.cpp
    src/functionalext/supplement/stdio/vprintf.cpp
    src/functionalext/supplement/stdio/vsnprintf.cpp
    src/functionalext/supplement/stdio/vsprintf.cpp
    src/functionalext/supplement/stdio/vsscanf.cpp
    src/functionalext/supplement/stdio/vswprintf.cpp
    src/functionalext/supplement/stdio/vswscanf.cpp
    src/functionalext/supplement/stdio/vwprintf.cpp
    src/functionalext/supplement/stdio/wcstoll.cpp
    src/functionalext/supplement/stdio/wcstoull.cpp
    src/functionalext/supplement/stdio/wprintf.cpp
    src/functionalext/supplement/stdlib/imaxabs.cpp
    src/functionalext/supplement/stdlib/imaxdiv.cpp
    src/functionalext/supplement/stdlib/labs.cpp
    src/functionalext/supplement/stdlib/ldiv.cpp
    src/functionalext/supplement/stdlib/llabs.cpp
    src/functionalext/supplement/stdlib/lldiv.cpp
    src/functionalext/supplement/stdlib/strtoimax.cpp
    src/functionalext/supplement/stdlib/strtoumax.cpp
    src/functionalext/supplement/stdlib/wcstod.cpp
    src/functionalext/supplement/stdlib/wcstof.cpp
    src/functionalext/supplement/stdlib/wcstold.cpp
    src/functionalext/supplement/stdlib/wcstoimax.cpp
    src/functionalext/supplement/stdlib/wcstoumax.cpp
    src/functionalext/supplement/stdlib/functionalext_fcvt.cpp
    src/functionalext/supplement/string/index.cpp
    src/functionalext/supplement/string/memccpy.cpp
    src/functionalext/supplement/string/memchr.cpp
    src/functionalext/supplement/string/memmove.cpp
    src/functionalext/supplement/string/mempcpy.cpp
    src/functionalext/supplement/string/strcasecmp.cpp
    src/functionalext/supplement/string/strcasestr.cpp
    src/functionalext/supplement/string/strcat.cpp
    src/functionalext/supplement/string/strchrnul.cpp
    src/functionalext/supplement/string/strcoll.cpp
    src/functionalext/supplement/string/strdup.cpp
    src/functionalext/supplement/string/strerror_r.cpp
    src/functionalext/supplement/string/strndup.cpp
    src/functionalext/supplement/string/strnlen.cpp
    src/functionalext/supplement/string/strsep.cpp
    src/functionalext/supplement/string/strsignal.cpp
    src/functionalext/supplement/string/wcpcpy.cpp
    src/functionalext/supplement/string/wcscasecmp.cpp
    src/functionalext/supplement/string/wcscasecmp_l.cpp
    src/functionalext/supplement/string/wcschr.cpp
    src/functionalext/supplement/string/wcscmp.cpp
    src/functionalext/supplement/string/wcscspn.cpp
    src/functionalext/supplement/string/wcslen.cpp
    src/functionalext/supplement/string/wcsncasecmp.cpp
    src/functionalext/supplement/string/wcsncasecmp_l.cpp
    src/functionalext/supplement/string/wcsncat.cpp
    src/functionalext/supplement/string/wcsncmp.cpp
    src/functionalext/supplement/string/wcsnlen.cpp
    src/functionalext/supplement/string/wcsrchr.cpp
    src/functionalext/supplement/string/wcsspn.cpp
    src/functionalext/supplement/string/wcstok.cpp
    src/functionalext/supplement/string/wcswcs.cpp
    src/functionalext/supplement/string/wmemchr.cpp
    src/functionalext/supplement/string/memmem.cpp
    src/functionalext/supplement/string/memrchr.cpp
    src/functionalext/supplement/string/stpcpy.cpp
    src/functionalext/supplement/string/stpncpy.cpp
    src/functionalext/supplement/string/strrchr.cpp
    src/functionalext/supplement/string/wcscpy.cpp
    src/functionalext/supplement/string/wcsdup.cpp
    src/functionalext/supplement/string/wcsncpy.cpp
    src/functionalext/supplement/string/wcspbrk.cpp
    src/functionalext/supplement/string/wmemcmp.cpp
    src/functionalext/supplement/string/wmemcpy.cpp
    src/functionalext/supplement/string/wmemmove.cpp
    src/functionalext/supplement/string/wmemset.cpp
    src/functionalext/supplement/temp/mktemp.cpp
    src/functionalext/supplement/temp/mkostemp.cpp
    src/functionalext/supplement/temp/mkostemps.cpp
    src/functionalext/supplement/temp/mkstemp.cpp
    src/functionalext/supplement/temp/mkstemps.cpp
    src/functionalext/supplement/thread/mtx_init.cpp
    src/functionalext/supplement/thread/mtx_lock.cpp
    src/functionalext/supplement/thread/mtx_timedlock.cpp
    src/functionalext/supplement/thread/mtx_trylock.cpp
    src/functionalext/supplement/thread/mtx_unlock.cpp
    src/functionalext/supplement/thread/pthread_atfork.cpp
    src/functionalext/supplement/thread/call_once.cpp
    src/functionalext/supplement/thread/pthread_detach.cpp
    src/functionalext/supplement/thread/pthread_equal.cpp
    src/functionalext/supplement/thread/pthread_join.cpp
    src/functionalext/supplement/thread/pthread_self.cpp
    src/functionalext/supplement/thread/pthread_setschedprio.cpp
    src/functionalext/supplement/thread/pthread_spin_lock.cpp
    src/functionalext/supplement/thread/pthread_spin_trylock.cpp
    src/functionalext/supplement/thread/pthread_spin_unlock.cpp
    src/functionalext/supplement/thread/pthread_attr_destroy.cpp
    src/functionalext/supplement/thread/pthread_attr_get.cpp
    src/functionalext/supplement/thread/pthread_attr_getstack.cpp
    src/functionalext/supplement/thread/pthread_attr_init.cpp
    src/functionalext/supplement/thread/pthread_attr_setguardsize.cpp
    src/functionalext/supplement/thread/pthread_attr_setinheritsched.cpp
    src/functionalext/supplement/thread/pthread_attr_setschedparam.cpp
    src/functionalext/supplement/thread/pthread_attr_setschedpolicy.cpp
    src/functionalext/supplement/thread/pthread_attr_setscope.cpp
    src/functionalext/supplement/thread/pthread_attr_setstack.cpp
    src/functionalext/supplement/thread/pthread_attr_setstacksize.cpp
    src/functionalext/supplement/thread/pthread_barrier_destroy.cpp
    src/functionalext/supplement/thread/pthread_barrier_init.cpp
    src/functionalext/supplement/thread/pthread_barrier_wait.cpp
    src/functionalext/supplement/thread/pthread_barrierattr_init.cpp
    src/functionalext/supplement/thread/pthread_barrierattr_setpshared.cpp
    src/functionalext/supplement/thread/pthread_create.cpp
    src/functionalext/supplement/thread/pthread_exit.cpp
    src/functionalext/supplement/thread/pthread_getattr_np.cpp
    src/functionalext/supplement/thread/pthread_getschedparam.cpp
    src/functionalext/supplement/thread/pthread_getspecific.cpp
    src/functionalext/supplement/thread/pthread_key_create.cpp
    src/functionalext/supplement/thread/pthread_mutex_lock.cpp
    src/functionalext/supplement/thread/pthread_mutex_unlock.cpp
    src/functionalext/supplement/thread/pthread_once.cpp
    src/functionalext/supplement/thread/pthread_setspecific.cpp
    src/functionalext/supplement/thread/pthread_setschedparam.cpp
    src/functionalext/supplement/thread/pthread_cond_broadcast.cpp
    src/functionalext/supplement/thread/pthread_cond_destroy.cpp
    src/functionalext/supplement/thread/pthread_cond_init.cpp
    src/functionalext/supplement/thread/pthread_cond_signal.cpp
    src/functionalext/supplement/thread/pthread_cond_timedwait_sup.cpp
    src/functionalext/supplement/thread/pthread_cond_wait.cpp
    src/functionalext/supplement/thread/pthread_condattr_destroy.cpp
    src/functionalext/supplement/thread/pthread_condattr_init.cpp
    src/functionalext/supplement/thread/pthread_condattr_setclock_sup.cpp
    src/functionalext/supplement/thread/pthread_condattr_setpshared.cpp
    src/functionalext/supplement/thread/pthread_getcpuclockid.cpp
    src/functionalext/supplement/thread/pthread_key_delete.cpp
    src/functionalext/supplement/thread/pthread_mutex_destroy.cpp
    src/functionalext/supplement/thread/pthread_mutex_init.cpp
    src/functionalext/supplement/thread/pthread_mutex_timedlock.cpp
    src/functionalext/supplement/thread/pthread_mutex_trylock.cpp
    src/functionalext/supplement/thread/pthread_mutexattr_destroy.cpp
    src/functionalext/supplement/thread/pthread_mutexattr_setprotocol.cpp
    src/functionalext/supplement/thread/pthread_mutexattr_setpshared.cpp
    src/functionalext/supplement/thread/pthread_mutexattr_settype.cpp
    src/functionalext/supplement/thread/pthread_rwlock_destroy.cpp
    src/functionalext/supplement/thread/pthread_rwlock_rdlock_sup.cpp
    src/functionalext/supplement/thread/pthread_rwlock_timedrdlock.cpp
    src/functionalext/supplement/thread/pthread_rwlock_timedwrlock.cpp
    src/functionalext/supplement/thread/pthread_rwlock_tryrdlock.cpp
    src/functionalext/supplement/thread/pthread_rwlock_trywrlock.cpp
    src/functionalext/supplement/thread/pthread_rwlockattr_destroy.cpp
    src/functionalext/supplement/thread/pthread_rwlockattr_init.cpp
    src/functionalext/supplement/thread/pthread_rwlockattr_setpshared.cpp
    src/functionalext/supplement/thread/pthread_sigmask.cpp
    src/functionalext/supplement/thread/thrd_create.cpp
    src/functionalext/supplement/thread/thrd_current.cpp
    src/functionalext/supplement/thread/thrd_detach.cpp
    src/functionalext/supplement/thread/thrd_equal.cpp
    src/functionalext/supplement/thread/thrd_join.cpp
    src/functionalext/supplement/thread/thrd_sleep.cpp
    src/functionalext/supplement/thread/thrd_yield.cpp
    src/functionalext/supplement/thread/tss_set.cpp
    src/functionalext/supplement/time/mktime_sup.cpp
    src/functionalext/supplement/time/timer_delete.cpp
    src/functionalext/supplement/time/times.cpp
    src/functionalext/supplement/time/wcsftime_l.cpp
    src/functionalext/supplement/unistd/getcwd.cpp
    src/functionalext/supplement/unistd/getgroups.cpp
    src/functionalext/supplement/unistd/getlogin.cpp
    src/functionalext/supplement/unistd/getlogin_r.cpp
    src/functionalext/supplement/unistd/getpgid.cpp
    src/functionalext/supplement/unistd/getpgrp.cpp
    src/functionalext/supplement/unistd/getppid.cpp
    src/functionalext/supplement/unistd/getsid.cpp
    src/functionalext/supplement/unistd/link.cpp
    src/functionalext/supplement/unistd/pause.cpp
    src/functionalext/supplement/unistd/pipe2.cpp
    src/functionalext/supplement/unistd/setsid.cpp
    src/functionalext/supplement/unistd/sleep.cpp
    src/functionalext/supplement/unistd/usleep.cpp
    src/functionalext/supplement/unistd/writev.cpp
    src/functionalext/supplement/unistd/access.cpp
    src/functionalext/supplement/unistd/fchdir.cpp
    src/functionalext/supplement/unistd/nice.cpp
    src/functionalext/supplement/wctype/iswctype_l.cpp
    src/functionalext/supplement/wctype/iswgraph.cpp
    src/functionalext/unittest/unit_test_assert_fail.cpp
    src/functionalext/unittest/unit_test_assert_fail_dialog.cpp
    src/functionalext/unittest/unit_test_fatal_message.cpp
    src/math/exp.cpp
    src/math/exp2.cpp
    src/math/exp2f.cpp
    src/math/exp2l.cpp
    src/math/expf.cpp
    src/math/expl.cpp
    src/math/expm1.cpp
    src/math/expm1f.cpp
    src/math/expm1l.cpp
    src/math/fabs.cpp
    src/math/fabsf.cpp
    src/math/fabsl.cpp
    src/math/fdiml.cpp
    src/math/floor.cpp
    src/math/floorf.cpp
    src/math/floorl.cpp
    src/math/fmax.cpp
    src/math/fmaxf.cpp
    src/math/fmaxl.cpp
    src/math/frexp.cpp
    src/math/frexpf.cpp
    src/math/frexpl.cpp
    src/math/hypot.cpp
    src/math/hypotf.cpp
    src/math/hypotl.cpp
    src/math/ilogb.cpp
    src/math/ilogbf.cpp
    src/math/ilogbl.cpp
    src/math/isless.cpp
    src/nativehook/runtest.cpp
    src/nativehook/musl_preinit_common_stubs.cpp
    src/regression/iconv-roundtrips.cpp
    src/regression/malloc-free-performance.cpp
    src/regression/malloc-multi-thread-performance.cpp
    src/regression/pthread_condattr_setclock.cpp
    src/regression/raise-race.cpp
    src/regression/sigaltstack.cpp
    src/functionalext/supplement/unistd/dup3.cpp
    src/functionalext/supplement/unistd/faccessat.cpp
    src/functionalext/supplement/unistd/fchown.cpp
    src/functionalext/supplement/unistd/fchownat.cpp
    src/functionalext/supplement/unistd/fdatasync.cpp
    src/functionalext/supplement/unistd/fsync.cpp
    src/functionalext/supplement/unistd/ftruncate.cpp
    src/functionalext/supplement/unistd/read.cpp
    src/functionalext/supplement/unistd/readv.cpp
    src/functionalext/supplement/unistd/renameat.cpp
    src/functionalext/supplement/unistd/symlinkat.cpp
    src/functionalext/supplement/unistd/ttyname_r.cpp
    src/functionalext/supplement/unistd/unlink.cpp
    src/functionalext/supplement/unistd/unlinkat.cpp
    src/regression/execle-env.cpp
    src/regression/ftello-unflushed-append.cpp
    src/regression/malloc-double-free-check.cpp
    src/regression/malloc-encode-pointer.cpp
    src/regression/malloc-modify-pointer.cpp
    src/regression/malloc-oom.cpp
    src/regression/malloc-safe-unlink.cpp
    src/regression/pthread_cond-smasher.cpp
    src/regression/pthread_create-oom.cpp
    src/regression/pthread_once-deadlock.cpp
    src/regression/pthread_rwlock-ebusy.cpp
    src/regression/pthread-robust-detach.cpp
    src/regression/setenv-oom.cpp
    src/regression/tls_get_new-dtv.cpp
    src/functionalext/time/asctime.cpp
    src/functionalext/time/asctime_r.cpp
    src/functionalext/time/difftime.cpp
    src/functionalext/time/gmtime.cpp
    src/functionalext/time/gmtime_r.cpp
    src/functionalext/time/localtime.cpp
    src/functionalext/time/localtime_r.cpp
    src/functionalext/time/mktime.cpp
    src/functionalext/time/strftime_ext.cpp
    src/functionalext/time/strftime_l.cpp
    src/functionalext/time/strptime_ext.cpp
    src/functionalext/time/timegm.cpp
    src/functionalext/supplement/network/accept4.cpp
    src/functionalext/supplement/network/getaddrinfo.cpp
    src/functionalext/supplement/network/getpeername.cpp
    src/functionalext/supplement/network/getsockopt_network.cpp
    src/functionalext/supplement/network/listen.cpp
    src/functionalext/supplement/network/recv.cpp
    src/functionalext/supplement/network/recvmsg.cpp
    src/functionalext/supplement/network/recvmmsg.cpp
    src/functionalext/supplement/network/send.cpp
    src/functionalext/supplement/network/shutdown.cpp
    src/functionalext/supplement/linux/__ppoll_time64.cpp
    src/functionalext/supplement/linux/clock_adjtime.cpp
    src/functionalext/supplement/linux/fallocate.cpp
    src/functionalext/supplement/linux/fgetxattr.cpp
    src/functionalext/supplement/linux/flock.cpp
    src/functionalext/supplement/linux/inotify.cpp
    src/functionalext/supplement/linux/membarrier.cpp
    src/functionalext/supplement/linux/ppoll.cpp
    src/functionalext/supplement/linux/utimes.cpp
    src/functionalext/supplement/misc/a64l.cpp
    src/functionalext/supplement/misc/endmntent.cpp
    src/functionalext/supplement/misc/forkpty.cpp
    src/functionalext/supplement/misc/getmntent.cpp
    src/functionalext/supplement/misc/getmntent_r.cpp
    src/functionalext/supplement/misc/getrusage.cpp
    src/functionalext/supplement/misc/ioctl.cpp
    src/functionalext/supplement/misc/lockf.cpp
    src/functionalext/supplement/stat/chmod.cpp
    src/functionalext/supplement/stat/fchmod.cpp
    src/functionalext/supplement/stat/fchmodat.cpp
    src/functionalext/supplement/stat/futimesat.cpp
    src/functionalext/supplement/stat/utimensat.cpp
    src/functionalext/supplement/malloc/resTraceFreeRegion.cpp
    src/functionalext/supplement/malloc/resTraceMove.cpp
    src/functionalext/supplement/malloc/restrace.cpp
    src/functionalext/supplement/malloc/restraceExt.cpp
    src/functionalext/sigchain/sigchain_intercept_pthread_sigmask.cpp
    src/functionalext/sigchain/sigchain_rm_special_handler.cpp
    src/functionalext/sigchain/sigchain_set_pre_validation_ignore_thread_test.cpp
    src/functionalext/supplement/math/__signbit.cpp
    src/functionalext/supplement/math/finite.cpp
    src/functionalext/supplement/math/functionalext_pow10.cpp
    src/functionalext/ldso_debug/ldso_debug_test.cpp
    src/functionalext/ldso_debug/ldso_memleak_check.cpp
    src/functionalext/supplement/legacy/daemon.cpp
    src/functionalext/supplement/legacy/futimes.cpp
    src/functionalext/supplement/mman/mmap.cpp
    src/functionalext/supplement/mman/munmap.cpp
    src/functionalext/supplement/wctype/iswalnum_l.cpp
    src/functionalext/supplement/wctype/iswgraph_l.cpp
    src/functionalext/info/fatal_message.cpp
    src/functionalext/legacy/ulimit.cpp
    src/functionalext/sched/sched_setparam.cpp
    src/functionalext/supplement/fenv/feupdateenv.cpp
    src/functionalext/supplement/ldso/dl_iterate_phdr.cpp
    src/functionalext/supplement/manual/env/a_stack_chk_fail.cpp
    src/functionalext/supplement/process/posix_spawn_file_actions_addopen.cpp
    src/functionalext/supplement/select/select.cpp
    src/functionalext/thread/pthread_guard_size.cpp
)

add_library(TlsGetNewDtvDso SHARED lib/tls_get_new-dtv_dso.c)
set_target_properties(TlsGetNewDtvDso PROPERTIES OUTPUT_NAME "tls_get_new-dtv_dso")

target_compile_definitions(entry PRIVATE _GNU_SOURCE=1)

set_source_files_properties(
    src/functional/search_hsearch.cpp
    src/functional/search_insque.cpp
    src/functional/search_lsearch.cpp
    src/regression/lrand48-signextend.cpp
    src/regression/sigaltstack.cpp
    src/regression/putenv-doublefree.cpp
    PROPERTIES COMPILE_DEFINITIONS "_XOPEN_SOURCE=700"
)
set_source_files_properties(
    src/regression/mkdtemp-failure.cpp
    src/regression/mkstemp-failure.cpp
    src/regression/dn_expand-ptr-0.cpp
    src/regression/dn_expand-empty.cpp
    src/regression/daemon-failure.cpp
    PROPERTIES COMPILE_DEFINITIONS "_DEFAULT_SOURCE=1;_BSD_SOURCE=1"
)

target_link_libraries(
    entry
    PUBLIC
    libace_napi.z.so
    libhilog_ndk.z.so
    c
    pthread
    DsoNoSymver
    DsoEasySymver
    DsoHardSymver
)

target_link_options(entry PRIVATE -Wl,--export-dynamic)

# lib_7: 静态库（不会被打包为 .so），使用 lib_5.c 源代码（提供 debug_test_5）
add_library(LdsoDebugTestLib7 SHARED lib/ldso_debug_test_lib_5.c)
set_target_properties(LdsoDebugTestLib7 PROPERTIES OUTPUT_NAME "ldso_debug_test_lib_7")

# lib_6: 依赖 lib_7，使用 lib_4.c 源代码（调用 debug_test_5）
# 注意：不链接 lib_7，让运行时动态链接器去找（会失败）
add_library(LdsoDebugTestLib6 SHARED lib/ldso_debug_test_lib_4.c)
set_target_properties(LdsoDebugTestLib6 PROPERTIES OUTPUT_NAME "ldso_debug_test_lib_6")
target_link_libraries(LdsoDebugTestLib6 PRIVATE LdsoDebugTestLib7)

# lib_10: 静态库，使用 lib_8.c 源代码
add_library(LdsoDebugTestLib10 SHARED lib/ldso_debug_test_lib_8.c)
set_target_properties(LdsoDebugTestLib10 PROPERTIES OUTPUT_NAME "ldso_debug_test_lib_10")

# lib_9: 依赖 lib_10，使用 lib_7.c 源代码（调用 debug_test_8，需要链接 lib_10）
add_library(LdsoDebugTestLib9 SHARED lib/ldso_debug_test_lib_7.c)
set_target_properties(LdsoDebugTestLib9 PROPERTIES OUTPUT_NAME "ldso_debug_test_lib_9")
target_link_libraries(LdsoDebugTestLib9 PRIVATE LdsoDebugTestLib10)

# lib_8: 依赖 lib_9，使用 lib_6.c 源代码（调用 debug_test_7）
add_library(LdsoDebugTestLib8 SHARED lib/ldso_debug_test_lib_6.c)
set_target_properties(LdsoDebugTestLib8 PROPERTIES OUTPUT_NAME "ldso_debug_test_lib_8")
target_link_libraries(LdsoDebugTestLib8 PRIVATE LdsoDebugTestLib9)

add_library(DlcloseRecursive SHARED lib/dlclose_recursive.cpp)
set_target_properties(DlcloseRecursive PROPERTIES OUTPUT_NAME "dlclose_recursive")

add_library(DlMultithreadDso SHARED lib/dl_multithread_test_dso.c lib/print.c)
set_target_properties(DlMultithreadDso PROPERTIES OUTPUT_NAME "dl_multithread_test_dso")

add_library(DlOpenDso SHARED lib/dlopen_dso.c)
set_target_properties(DlOpenDso PROPERTIES OUTPUT_NAME "dlopen_dso")

add_library(DlOpenInit SHARED lib/dlopen_init.c)
set_target_properties(DlOpenInit PROPERTIES OUTPUT_NAME "dlopen_init")

add_library(TlsTimer SHARED lib/tls_timer.c)
set_target_properties(TlsTimer PROPERTIES OUTPUT_NAME "tls_timer")

# dlopen_weaklink test libraries
add_library(Foo SHARED lib/foo.c)
set_target_properties(Foo PROPERTIES OUTPUT_NAME "foo")
target_compile_options(Foo PRIVATE -fPIC -DSHARED -Wall)

add_library(DlopenWeaklinkA SHARED lib/dlopen_weaklink_a.c)
set_target_properties(DlopenWeaklinkA PROPERTIES OUTPUT_NAME "dlopen_weaklink_a")
target_compile_options(DlopenWeaklinkA PRIVATE -fPIC -DSHARED -Wall)
target_link_libraries(DlopenWeaklinkA PRIVATE Foo)
target_link_options(DlopenWeaklinkA PRIVATE 
    -Wl,-rpath=/data/local/tmp/libc-test-lib/
)

add_library(DlopenWeaklinkB SHARED lib/dlopen_weaklink_b.c)
set_target_properties(DlopenWeaklinkB PROPERTIES OUTPUT_NAME "dlopen_weaklink_b")
target_compile_options(DlopenWeaklinkB PRIVATE -fPIC -DSHARED -Wall)
target_link_libraries(DlopenWeaklinkB PRIVATE Foo)
target_link_options(DlopenWeaklinkB PRIVATE 
    -Wl,-rpath=/data/local/tmp/libc-test-lib/
)

add_library(DlopenWeaklinkC SHARED lib/dlopen_weaklink_c.c)
set_target_properties(DlopenWeaklinkC PROPERTIES OUTPUT_NAME "dlopen_weaklink_c")
target_compile_options(DlopenWeaklinkC PRIVATE -fPIC -DSHARED -Wall)
target_link_libraries(DlopenWeaklinkC PRIVATE DlopenWeaklinkA DlopenWeaklinkB)
target_link_options(DlopenWeaklinkC PRIVATE 
    -Wl,-rpath=/data/local/tmp/libc-test-lib/
)

add_library(DlopenWeaklinkD SHARED lib/dlopen_weaklink_d.c)
set_target_properties(DlopenWeaklinkD PROPERTIES OUTPUT_NAME "dlopen_weaklink_d")
target_compile_options(DlopenWeaklinkD PRIVATE -fPIC -DSHARED -Wall)
target_link_libraries(DlopenWeaklinkD PRIVATE DlopenWeaklinkB)
target_link_options(DlopenWeaklinkD PRIVATE 
    -Wl,-rpath=/data/local/tmp/libc-test-lib/
)

add_library(TlsInitDlopen SHARED lib/tls_init_dso.c)
set_target_properties(TlsInitDlopen PROPERTIES OUTPUT_NAME "tls_init_dso")

add_library(AtexitDlcloseDso SHARED lib/atexit_dlclose_dso.c)
set_target_properties(AtexitDlcloseDso PROPERTIES OUTPUT_NAME "atexit_dlclose_dso")

add_library(DlcloseResetDso SHARED lib/dlclose_reset_dso.c)
set_target_properties(DlcloseResetDso PROPERTIES OUTPUT_NAME "dlclose_reset_dso")

add_library(LdsoCfiTestLib SHARED lib/ldso_cfi_test_lib.c)
set_target_properties(LdsoCfiTestLib PROPERTIES OUTPUT_NAME "ldso_cfi_test_lib")

add_library(DlopenExtRelroDso SHARED lib/dlopen_ext_relro_dso.c)
set_target_properties(DlopenExtRelroDso PROPERTIES OUTPUT_NAME "dlopen_ext_relro_dso")

# symver test libraries
add_library(DsoNoSymver SHARED lib/dso_no_symver.c)
set_target_properties(DsoNoSymver PROPERTIES OUTPUT_NAME "dso_no_symver")

add_library(DsoEasySymver SHARED lib/dso_easy_symver.c lib/dso_easy_symver.map)
set_target_properties(DsoEasySymver PROPERTIES OUTPUT_NAME "dso_easy_symver")
target_link_options(DsoEasySymver PRIVATE "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/lib/dso_easy_symver.map")

add_library(DsoHardSymver SHARED lib/dso_hard_symver.c lib/dso_hard_symver.map)
set_target_properties(DsoHardSymver PROPERTIES OUTPUT_NAME "dso_hard_symver")
target_link_options(DsoHardSymver PRIVATE "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/lib/dso_hard_symver.map")

add_library(RelocSymverDso SHARED lib/reloc_symver_dso.c lib/dso_no_symver.c lib/dso_easy_symver.c lib/dso_easy_symver.map)
set_target_properties(RelocSymverDso PROPERTIES OUTPUT_NAME "reloc_symver_dso")
target_link_options(RelocSymverDso PRIVATE "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/lib/dso_easy_symver.map")

# 添加自定义命令：构建完成后删除 lib_7 和 lib_10，防止它们被打包
add_custom_command(TARGET LdsoDebugTestLib6 POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E remove -f 
        ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/libldso_debug_test_lib_7.so
    COMMENT "Removing libldso_debug_test_lib_7.so to simulate missing dependency"
)

add_custom_command(TARGET LdsoDebugTestLib8 POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E remove -f 
        ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}/libldso_debug_test_lib_10.so
    COMMENT "Removing libldso_debug_test_lib_10.so to simulate missing dependency"
)