import { describe, it, expect, TestType, Size, Level } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base'

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export const FILE_CONTENT = 'hello world';

export default function fileIORandomAccessFileSetFilePointer() {
  describe('fileIO_randomAccessFile_setFilePointer', (): void => {

    /**
     * @tc.number SUB_STORAGE_fileIO_randomaccessfile_set_file_pointer_sync_static_0000
     * @tc.name fileIO_randomaccessfile_set_file_pointer_sync_static_000
     * @tc.desc Test setFilePointer() interface. Set file offset pointer position and read will start from filePointer + offset
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it('fileIO_randomaccessfile_set_file_pointer_sync_static_000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let fpath = await Utils.nextFileName('fileIO_randomaccessfile_set_file_pointer_sync_static_000');
      expect(await Utils.prepareFile(fpath, FILE_CONTENT)).assertTrue();

      try {
        let randomaccessfile = fs.createRandomAccessFileSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        expect(randomaccessfile.filePointer == 0).assertTrue();
        let initFilePointer = 5;
        randomaccessfile.setFilePointer(initFilePointer);
        expect(randomaccessfile.filePointer == initFilePointer).assertTrue();

        let initOffset = 5;
        let readLen = randomaccessfile.readSync(new ArrayBuffer(4096), { offset: initOffset });
        expect(readLen == FILE_CONTENT.length - initFilePointer - initOffset).assertTrue();

        randomaccessfile.close();
        fs.unlinkSync(fpath);
      } catch(err: BusinessError) {
        hilog.info(domain, tag, '%{public}s', 'fileIO_randomaccessfile_set_file_pointer_sync_static_000 has failed for ' + JSON.stringify(err));
        expect(false).assertTrue();
      }
    });
  });
}
