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
import fileIOCopyfile from './members/copyFile.test.js'
import fileIOCreateStream from './members/createStream.test.js'
import fileIOFdatasync from './members/fdatasync.test.js'
import fileIOFdOpenStream from './members/fdopenStream.test.js'
import fileIOFileLock from './members/fileLock.test.js'
import fileIOFsync from './members/fsync.test.js'
import fileIOHash from './members/hash.test.js'
import fileIOListfile from './members/listFile.test.js'
import fileIOLstat from './members/lstat.test.js'
import fileIOMkdir from './members/mkdir.test.js'
import fileIOMkdtemp from './members/mkdtemp.test.js'
import fileIOMoveFile from './members/moveFile.test.js'
import fileIOOpen from './members/open.test.js'
import fileIORead from './members/read.test.js'
import fileIOReadtext from './members/readtext.test.js'
import fileIORename from './members/rename.test.js'
import fileIORmdir from './members/rmdir.test'
import fileIOStat from './members/stat.test.js'
import fileIOStreamClose from './class_stream/close.test.js'
import fileIOStreamFlush from './class_stream/flush.test.js'
import fileIOStreamRead from './class_stream/read.test.js'
import fileIOStreamWrite from './class_stream/write.test.js'
import fileIOSymlink from './members/symlink.test.js'
import fileIOTruncate from './members/truncate.test.js'
import fileIOUnlink from './members/unlink.test.js'
import fileIOWrite from './members/write.test.js'
export default function testsuite() {
    fileIOAccess()
    fileIOClose()
    fileIOCopyfile()
    fileIOCreateStream()
    fileIOFdatasync()
    fileIOFdOpenStream()
    fileIOFileLock()
    fileIOFsync()
    fileIOHash()
    fileIOListfile()
    fileIOLstat()
    fileIOMkdir()
    fileIOMkdtemp()
    fileIOMoveFile()
    fileIOOpen()
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
    fileIOWrite()
}
