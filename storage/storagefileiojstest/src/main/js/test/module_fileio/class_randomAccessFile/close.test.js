/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import {
    fileio, nextFileName,
    describe, it, expect
} from '../../Common';

export default function fileioRandomAccessFileClose() {
describe('fileio_randomAccessFile_close', function () {

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_CLOSE_SYNC_0000
     * @tc.name fileio_randomaccessfile_close_sync_000
     * @tc.desc Test closeSync() interface. Close the RandomAccessFile object.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_randomaccessfile_close_sync_000', 0, async function () {
        let fpath = await nextFileName('fileio_randomaccessfile_close_sync_000');

        try {
            let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o102);
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        } catch(err) {
            console.info('fileio_randomaccessfile_close_sync_000 has failed for ' + err);
            expect(null).assertFail();
        }
    });

    /**
     * @tc.number SUB_STORAGE_FILEIO_RANDOMACCESSFILE_CLOSE_SYNC_0100
     * @tc.name fileio_randomaccessfile_close_sync_001
     * @tc.desc Test closeSync() interface. Parameter mismatch.
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileio_randomaccessfile_close_sync_001', 0, async function () {
        let fpath = await nextFileName('fileio_randomaccessfile_close_sync_001');
        let randomaccessfile = fileio.createRandomAccessFileSync(fpath, 0, 0o102);

        try {
            randomaccessfile.closeSync(1);
            expect(false).assertTrue();
        } catch(err) {
            console.info('fileio_randomaccessfile_close_sync_001 has failed for ' + err);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            randomaccessfile.closeSync();
            fileio.unlinkSync(fpath);
        }
    });
})
}