/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import fileIOAccess from "./Access.test";
import fileIOClose from "./Close.test";
import fileIOCopyDir from "./CopyDir.test";
import fileIOCopyfile from "./CopyFile.test";
import fileIOCreateStream from "./CreateStream.test";
import fileIOCreateRandomAccessFile from "./CreateRandomAccessFile.test";
import fileIODup from "./Dup.test";
import fileIOFdatasync from "./Fdatasync.test";
import fileIOFsync from "./Fsync.test";
import fileIOGetxattr from "./Getxattr.test";
import fileIOLstat from "./Lstat.test";
import fileIOListfile from "./ListFile.test";
import fileIOMkdir from "./Mkdir.test";
import fileIOMkdir11 from "./Mkdir11.test";
import fileIOMkdtemp from "./Mkdtemp.test";
import fileIOMoveDir from "./MoveDir.test";
import fileIORead from "./Read.test";
import fileIOReadtext from './Readtext.test';
import fileIOReadLines from './ReadLines.test';
import fileIORename from './Rename.test';
import fileIORmdir from './Rmdir.test';
import fileIOStat from './Stat.test';
import fileIOTruncate from './Truncate.test';
import fileIOUnlink from './Unlink.test';
import fileIOSetxattr from './Setxattr.test';
import fileIOFileProperties from './class_file/File.test';
import fileIOFileGetParent from './class_file/FileGetParent.test';
import fileIOFileLock from './class_file/FileLock.test';
import fileIOOpen from './Open.test';
import fileIOSymlink from './Symlink.test';
import fileIOWrite from './Write.test';
import fileIOLseek from './Lseek.test';
import fileIOHash from './Hash.test';
import fileIOStreamClose from './class_stream/Close.test';
import fileIOStreamFlush from './class_stream/Flush.test';
import fscreateReadStream from './class_stream/CreateReadStream.test';
import fileIOStreamRead from './class_stream/Read.test';
import fileIOStreamWrite from './class_stream/Write.test';
import fileIOFdopenStream from './FdopenStream.test';
import fileIOWatcher from './Watcher.test';
import fileIORandomAccessFileClose from './class_randomAccessFile/Close.test';
import fileIORandomAccessFileRead from './class_randomAccessFile/Read.test';
import fileIORandomAccessFileSetFilePointer from './class_randomAccessFile/SetFilePointer.test';
import fileIORandomAccessFileWrite from './class_randomAccessFile/Write.test';
import atomicFileTest from './class_atomicFile/AtomicFile.test';
import fileIODfsConnect from './DfsConnect.test';
export default function testsuite() {
    fileIOAccess();
    fileIOClose();
    fileIOCopyDir();
    fileIOCopyfile();
    fileIOCreateStream();
    fileIOCreateRandomAccessFile();
    fileIODup();
    fileIOFdatasync();
    fileIOFsync();
    fileIOGetxattr();
    fileIOLstat();
    fileIOMkdir();
    fileIOMkdir11();
    fileIOMkdtemp();
    fileIOMoveDir();
    fileIORead();
    fileIOReadtext();
    fileIOReadLines();
    fileIORename();
    fileIORmdir();
    fileIOStat();
    fileIOTruncate();
    fileIOUnlink();
    fileIOSetxattr();
    fileIOFileProperties();
    fileIOFileGetParent();
    fileIOFileLock();
    fileIOOpen();
    fileIOSymlink();
    fileIOWrite();
    fileIOLseek();
    fileIOListfile();
	fileIOHash();
    fileIOStreamClose();
    fileIOStreamFlush();
    fscreateReadStream();
    fileIOStreamRead();
    fileIOStreamWrite();
    fileIOFdopenStream();
    fileIOWatcher();
    fileIORandomAccessFileClose();
    fileIORandomAccessFileRead();
    fileIORandomAccessFileSetFilePointer();
    fileIORandomAccessFileWrite();
    atomicFileTest();
    fileIODfsConnect();
}
