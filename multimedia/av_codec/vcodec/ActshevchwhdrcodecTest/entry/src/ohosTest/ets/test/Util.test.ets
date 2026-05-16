import fs from '@ohos.file.fs';
import { hilog } from "@kit.PerformanceAnalysisKit";

const DEFAULT_TAG = 'ActsHevcswDecoderTest';

export default class Utils {
  static sleep(time: number) {
    return new Promise<string>((resolve, reject) => {
      setTimeout(() => {
        resolve("ok")
      }, time)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }


  static copyRawfileToFilesDirSync(rawfileName: string, context: Context) {
    let dir = context.filesDir + "/";
    try {
      let targetFilePath = dir + rawfileName;
      console.log("[rawfile_copy_to_sandbox] 222");
      context.resourceManager.getRawFileContent(rawfileName, (error, model_buffer) => {
        if (error) {
          console.log(
            `[rawfile_copy_to_sandbox] ${rawfileName} is
            copy failed:${error.code}, message: ${error.message}.`);
        } else {
          let file = fs.openSync(targetFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, model_buffer.buffer);
          fs.closeSync(file);
          console.log("[rawfile_copy_to_sandbox] ${rawfileName} is copy success");
        }
      });
      console.log("[rawfile_copy_to_sandbox] 333");
    } catch (error) {
      console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
    }
  }

  static fileCheckSync(fileName: string, context: Context): boolean {
    let targetFilePath = context.filesDir + "/" + fileName;
    try {
      return fs.accessSync(targetFilePath);
    } catch (err) {
      console.info(`file does not exists! access failed with error message: ${err.message} , error code:${err.code}`);
      return false;
    }
  }
}

export class Log {
  static error(msg: string, tag: string = DEFAULT_TAG) {
    hilog.error(0x0001, tag, msg);
  }

  static info(msg: string, tag: string = DEFAULT_TAG) {
    hilog.info(0x0001, tag, msg);
  }

  static debug(msg: string, tag: string = DEFAULT_TAG) {
    hilog.debug(0x0001, tag, msg);
  }
}

