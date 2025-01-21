/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import fileIOClose from "./members/close.test";
import fileIOFdatasync from "./members/fdatasync.test";
import fileIOFsync from "./members/fsync.test";
import fileIOMkdir from "./members/mkdir.test";
import fileIOMkdtemp from "./members/mkdtemp.test";
import fileIOOpen from "./members/open.test";
import fileIORead from "./members/read.test";
import fileIORename from "./members/rename.test";
import fileIORmdir from "./members/rmdir.test";
import fileIOStat from "./members/stat.test";
import fileIOTruncate from "./members/truncate.test";
import fileIOUnlink from "./members/unlink.test";
import fileIOWrite from "./members/write.test";

export default function testsuite() {
  fileIOClose();
  fileIOFdatasync();
  fileIOFsync();
  fileIOMkdir();
  fileIOMkdtemp();
  fileIOOpen();
  fileIORead();
  fileIORename();
  fileIORmdir();
  fileIOStat();
  fileIOTruncate();
  fileIOUnlink();
  fileIOWrite();
}
