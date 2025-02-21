/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import fileIOAccess from './members/access.test.js'
import fileIOClose from './members/close.test.js'
import fileIOCopyDir from './members/copyDir.test'
import fileIOCopyfile from './members/copyFile.test.js'
import fileIOCreateRandomAccessFile from './members/createRandomAccessFile.test.js'
import fileIOCreateStream from './members/createStream.test.js'
import fileIODup from './members/dup.test.js'
import fileIOFdatasync from './members/fdatasync.test.js'
import fileIOFdOpenStream from './members/fdopenStream.test.js'
import fileIOFsync from './members/fsync.test.js'
import fileIOHash from './members/hash.test.js'
import fileIOListfile from './members/listFile.test.js'
import fileIOLstat from './members/lstat.test.js'
import fileIOMkdir from './members/mkdir.test.js'
import fileIOMkdtemp from './members/mkdtemp.test.js'
import fileIOMoveDir from './members/moveDir.test.js'
import fileIOMoveFile from './members/moveFile.test.js'
import fileIOOpen from './members/open.test.js'
import fileIORandomAccessFileClose from './class_randomAccessFile/close.test.js'
import fileIORandomAccessFileRead from './class_randomAccessFile/read.test.js'
import fileIORandomAccessFileSetFilePointer from './class_randomAccessFile/setFilePointer.test.js'
import fileIORandomAccessFileWrite from './class_randomAccessFile/write.test.js'
import fileIORead from './members/read.test.js'
import fileIOReadtext from './members/readtext.test.js'
import fileIORename from './members/rename.test.js'
import fileIORmdir from './members/rmdir.test'
import fileIOStat from './members/stat.test.js'
import fileIOFileLock from './class_file/fileLock.test.js'
import fileIOFileProperties from './class_file/file.test.js'
import fileIOStreamClose from './class_stream/close.test.js'
import fileIOStreamFlush from './class_stream/flush.test.js'
import fileIOStreamRead from './class_stream/read.test.js'
import fileIOStreamWrite from './class_stream/write.test.js'
import fileIOSymlink from './members/symlink.test.js'
import fileIOTruncate from './members/truncate.test.js'
import fileIOUnlink from './members/unlink.test.js'
import fileIOWatcher from './members/watcher.test.js'
import fileIOWrite from './members/write.test.js'
import fileIORW from './members/filerw.test.js'
import fileIOLseek from './members/lseek.test.js'
import fileIOReadLines from './members/readLines.test.js'
import fileIOFileGetParent from './class_file/filegetParent.test.js'
import fileIOUtimes from './members/utimes.test.js'
import fileIOMkdir11 from './members/mkdir11.test.js'
import fileIOCopy from './members/copy.test.js'
export default function testsuite() {
    fileIOAccess()
    fileIOClose()
    fileIOCopyDir()
    fileIOCopyfile()
    fileIOCreateRandomAccessFile()
    fileIOCreateStream()
    fileIODup()
    fileIOFdatasync()
    fileIOFdOpenStream()
    fileIOFileLock()
    fileIOFileProperties()
    fileIOFsync()
    fileIOHash()
    fileIOListfile()
    fileIOLstat()
    fileIOMkdir()
    fileIOMkdtemp()
    fileIOMoveDir()
    fileIOMoveFile()
    fileIOOpen()
    fileIORandomAccessFileClose()
    fileIORandomAccessFileRead()
    fileIORandomAccessFileSetFilePointer()
    fileIORandomAccessFileWrite()
    fileIORead()
    fileIOReadtext()
    fileIORename()
    fileIORmdir()
    fileIOStat()
    fileIOStreamClose()
    fileIOStreamFlush()
    fileIOStreamRead()
    fileIOStreamWrite()
    fileIOSymlink()
    fileIOTruncate()
    fileIOUnlink()
    fileIOWatcher()
    fileIOWrite()
    fileIORW()
    fileIOLseek()
    fileIOReadLines()
    fileIOFileGetParent()
    fileIOUtimes()
    fileIOMkdir11()
    fileIOCopy()
}
