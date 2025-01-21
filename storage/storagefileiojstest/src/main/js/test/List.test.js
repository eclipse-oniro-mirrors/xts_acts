/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import fileIOTest from './FileIO.test.js'
import fileIOTestDir from './FileIODir.test.js'
import fileIOTestDirent from './FileIODirent.test.js'
import fileIOTestStat from './FileIOStat.test.js'
import fileIOTestStream from './FileIOStream.test.js'
import fileioDirClose from './module_fileio/class_dir/close.test.js'
import fileioDirListfile from './module_fileio/class_dir/listfile.test.js'
import fileioDirRead from './module_fileio/class_dir/read.test.js'
import fileioDirent from './module_fileio/class_dirent/all.test.js'
import fileioStream from './module_fileio/class_stream/all.test.js'
import fileioRandomAccessFileClose from './module_fileio/class_randomAccessFile/close.test.js'
import fileioRandomAccessFileRead from './module_fileio/class_randomAccessFile/read.test.js'
import fileioRandomAccessFileSetFilePointer from './module_fileio/class_randomAccessFile/setFilePointer.test.js'
import fileioRandomAccessFileWrite from './module_fileio/class_randomAccessFile/write.test.js'
import fileioStreamClose from './module_fileio/class_stream/close.test.js'
import fileioStreamFlush from './module_fileio/class_stream/flush.test.js'
import fileioStreamRead from './module_fileio/class_stream/read.test.js'
import fileioStreamWrite from './module_fileio/class_stream/write.test.js'
import fileioCreateWatcher from './module_fileio/class_watcher/createWatcher.test.js'
import fileioAccess from './module_fileio/members/access.test.js'
import fileioChmod from './module_fileio/members/chmod.test.js'
import fileioChown from './module_fileio/members/chown.test.js'
import fileioClose from './module_fileio/members/close.test.js'
import fileioCopyfile from './module_fileio/members/copyFile.test.js'
import fileioCreateRandomAccessFile from './module_fileio/members/createRandomAccessFile.test.js'
import fileioCreateStream from './module_fileio/members/createStream.test.js'
import fileioFchmod from './module_fileio/members/fchmod.test.js'
import fileioFchown from './module_fileio/members/fchown.test.js'
import fileioFdatasync from './module_fileio/members/fdatasync.test.js'
import fileioFdOpenStream from './module_fileio/members/fdopenStream.test.js'
import fileioFstat from './module_fileio/members/fstat.test.js'
import fileioFsync from './module_fileio/members/fsync.test.js'
import fileioFtruncate from './module_fileio/members/ftruncate.test.js'
import fileioHash from './module_fileio/members/hash.test.js'
import fileioLchown from './module_fileio/members/lchown.test.js'
import fileioLseek from './module_fileio/members/lseek.test.js'
import fileioLstat from './module_fileio/members/lstat.test.js'
import fileioMkdirRmdir from './module_fileio/members/mkdir_rmdir.test.js'
import fileioMkdtemp from './module_fileio/members/mkdtemp.test.js'
import fileioOpen from './module_fileio/members/open.test.js'
import fileioOpendirClose from './module_fileio/members/opendir_close.test.js'
import fileioOpenClose from './module_fileio/members/open_close.test.js'
import fileioPosixFallocate from './module_fileio/members/posix_fallocate.test.js'
import fileioRead from './module_fileio/members/read.test.js'
import fileioReadtext from './module_fileio/members/readtext.test.js'
import fileioRename from './module_fileio/members/rename.test.js'
import fileioRmdir from './module_fileio/members/rmdir.test.js'
import fileioStat from './module_fileio/members/stat.test.js'
import fileioSymlink from './module_fileio/members/symlink.test.js'
import fileioTruncate from './module_fileio/members/truncate.test.js'
import fileioUnlink from './module_fileio/members/unlink.test.js'
import fileioWrite from './module_fileio/members/write.test.js'
export default function testsuite() {
    fileIOTest()
    fileIOTestDir()
    fileIOTestDirent()
    fileIOTestStat()
    fileIOTestStream()
    fileioDirClose()
    fileioDirListfile()
    fileioDirRead()
    fileioDirent()
    fileioStream()
    fileioRandomAccessFileClose()
    fileioRandomAccessFileRead()
    fileioRandomAccessFileSetFilePointer()
    fileioRandomAccessFileWrite()
    fileioStreamClose()
    fileioStreamFlush()
    fileioStreamRead()
    fileioStreamWrite()
    fileioCreateWatcher()
    fileioAccess()
    fileioChmod()
    fileioChown()
    fileioClose()
    fileioCopyfile()
    fileioCreateRandomAccessFile()
    fileioCreateStream()
    fileioFchmod()
    fileioFchown()
    fileioFdatasync()
    fileioFdOpenStream()
    fileioFstat()
    fileioFsync()
    fileioFtruncate()
    fileioHash()
    fileioLchown()
    fileioLseek()
    fileioLstat()
    fileioMkdirRmdir()
    fileioMkdtemp()
    fileioOpen()
    fileioOpendirClose()
    fileioOpenClose()
    fileioPosixFallocate()
    fileioRead()
    fileioReadtext()
    fileioRename()
    fileioRmdir()
    fileioStat()
    fileioSymlink()
    fileioTruncate()
    fileioUnlink()
    fileioWrite()
}
