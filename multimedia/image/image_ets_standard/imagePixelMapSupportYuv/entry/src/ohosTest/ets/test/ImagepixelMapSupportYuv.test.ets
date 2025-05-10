import { describe, it, expect, beforeAll, afterEach, Level } from '@ohos/hypium'
import image from '@ohos.multimedia.image';
import hilog from '@ohos.hilog';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import rpc from '@ohos.rpc';
import {BusinessError} from '@ohos.base';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import resourceManager from '@ohos.resourceManager';
import fileIo from '@ohos.file.fs';

let testContext: common.UIAbilityContext;
let sleep = async (delay: number): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};



export default function imagepixelMapSupportYuv() {
  describe('pixelMapSupportYuvAbilityTest',  ()=> {

    let filePath: string;
    let fdNumber: number;

    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
    })

    const getFd = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + "/" + fileName;
      const file = fs.openSync(filePath)
      fdNumber = file.fd
    }

    const getBuffer = async (fileName: string) => {
      filePath = AppStorage.get('pathDir') + '/' + fileName;
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      const bufferRead = new ArrayBuffer(fileSize)
      fs.readSync(file.fd, bufferRead)
      return bufferRead
    }

    //创建imageSource对象并返回
    //type:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //fileName: 文件名,例: yuv_test_oto.jpeg
    const getImageSource = async(fileName:string, type:string)=>{
      let imageSourceApi:image.ImageSource
      if(type === "buffer"){
        const buffer = await getBuffer(fileName)
        imageSourceApi = image.createImageSource(buffer)
      }else if(type === "uri"){
        const filePath = AppStorage.get('pathDir') + '/' + fileName
        imageSourceApi = image.createImageSource(filePath)
      }else if(type === "rawfile"){
        const resourceMgr: resourceManager.ResourceManager = testContext.createModuleContext("entry_test").resourceManager
        const rawFileDescriptor = await resourceMgr.getRawFd(fileName)
        imageSourceApi = image.createImageSource(rawFileDescriptor)
      }else if(type === "incremental") {
        const picBuffer = await getBuffer(fileName)
        imageSourceApi = image.CreateIncrementalSource(picBuffer)
      } else{
        await getFd(fileName)
        imageSourceApi = image.createImageSource(fdNumber);
      }
      return imageSourceApi
    }

    //创建pixelMap对象并返回
    //imageSourceType:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //editable: 解码参数 editable
    let getPixMap_NV12 = async (fileName:string, imageSourceType:string, editable:boolean) => {
      let imageSourceApi = await getImageSource(fileName, imageSourceType);
      let decodingOptions: image.DecodingOptions = {
        editable: editable,
        desiredPixelFormat: 9,
      };
      let pixelMap_NV12: image.PixelMap = await imageSourceApi.createPixelMap(decodingOptions);
      return pixelMap_NV12
    }

    let getPixMap_NV21 = async (fileName:string, imageSourceType:string, editable:boolean) => {
      let imageSourceApi = await getImageSource(fileName, imageSourceType);
      let decodingOptions: image.DecodingOptions = {
        editable: editable,
        desiredPixelFormat: 8,
      };
      let pixelMap_NV21: image.PixelMap = await imageSourceApi.createPixelMap(decodingOptions);
      return pixelMap_NV21
    }

    //使用解码参数sourceDensity创建imagesource,并使用解码参数fitDensity创建pixelmap
    //imageSourceType:创建imageSource的方式，取值: uri、fd、buffer,rawfile,incremental 默认fd
    //fileName: 文件名,例: yuv_test_oto.jpeg
    //desiredPixelFormat:解码像素格式 例：8、9
    //sourceDensity:ImageSource的初始化选项。
    //fitDensity:pixelMap解码参数，图像像素密度
    //setDensityOption: 是否使用解码参数 sourceDensity/fitDensity
    const getDensityOptionPixelMap = async(fileName:string, desiredPixelFormat:number, sourceDensity:number,
                                           fitDensity:number, setDensityOption:boolean)=>{
      await getFd(fileName)
      if(setDensityOption){
        const sourceOption: image.SourceOptions = {sourceDensity: sourceDensity};
        const imageSource = image.createImageSource(fdNumber, sourceOption);
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          desiredPixelFormat: desiredPixelFormat,
          fitDensity: fitDensity
        };
        let pixelMap: image.PixelMap = await imageSource.createPixelMap(decodingOptions);
        return pixelMap
      }else{
        const imageSource = image.createImageSource(fdNumber)
        let decodingOptions: image.DecodingOptions = {
          editable: true,
          desiredPixelFormat: desiredPixelFormat,
        };
        let pixelMap: image.PixelMap = await imageSource.createPixelMap(decodingOptions);
        return pixelMap
      }
    }

    //校验pxielmap宽高是否与计算公式计算出的宽高一致。
    //testNum 用例编号  
    //pixelMap 需要校验的pixelMap对象
    //sourceDensity:ImageSource的初始化选项。
    //fitDensity:pixelMap解码参数，图像像素密度
    //width: 图片原始宽度
    //height: 图片原始高度
    const checkNzDensity = async (testNum:string, pixelMap: image.PixelMap, sourceDensity:number,
                                  fitDensity:number, width:number, height:number) =>{
      let widthResult = width
      let heightResult = height
      if(fitDensity !== 0 && sourceDensity !== 0 ){
        const halfSourceDensity = sourceDensity >> 1;
        widthResult = Math.floor((width * fitDensity + halfSourceDensity) / sourceDensity);
        heightResult = Math.floor((height * fitDensity + halfSourceDensity) / sourceDensity);
      }
      const imageInfo = await pixelMap.getImageInfo();
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:imageInfo: ${JSON.stringify(imageInfo)}`)
      return widthResult === imageInfo.size.width && heightResult === imageInfo.size.height
    }

    //检查 ArrayBuffer 中的内容是否包含 0
    const checkArrayBuffer =  (arrayBuffer:ArrayBuffer) =>{
      const bufferArr = new Uint8Array(arrayBuffer)
      let res = true
      for (let i = 0; i < bufferArr.length; i++) {
        if(bufferArr[i] == 0){
          res = false
        }
      }
      return res
    }

    //测试 pixelMap writeBufferToPixels，调用接口写入不含0的buffer，写入成功后读取，读取到的buffer不含0则用例成功返回True
    //pixelMap: 需要测试的pixelMap
    //testNum 用例编号
    //type:接口调用方式，包含 promise、callback、sync，默认为sync
    //writeBuffer/readBuffer 36 = 24(Y:4(height) * 6(width)) + 12(UV:24 * 0.5)
    const testWriteBufferToPixels = async (testNum:string, pixelMap:image.PixelMap, type:string) =>{

      let region: image.Region = { x: 0, y: 0, size: { height: 4, width: 6 } };
      await pixelMap.crop(region)
      const writeBuffer: ArrayBuffer = new ArrayBuffer(36);
      let bufferArr: Uint8Array = new Uint8Array(writeBuffer);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      let readBuffer = new ArrayBuffer(36)
      let result = false
      if(type == "promise"){
        await pixelMap.writeBufferToPixels(writeBuffer)
        await pixelMap.readPixelsToBuffer(readBuffer)
        result = checkArrayBuffer(readBuffer)
      }else if(type == "callback"){
        pixelMap.writeBufferToPixels(writeBuffer, (error: BusinessError) => {
          if (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:Failed to write data from a buffer to a
            PixelMap  ${error}`)
            result = false
          } else {
            pixelMap.readPixelsToBuffer(readBuffer, (error: BusinessError) => {
              if(error) {
                hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:Failed to read image pixel data  ${error}`)
                result = false
              } else {
                result = checkArrayBuffer(readBuffer)
              }
            })
          }
        })
        await sleep(1000)
      }else {
        pixelMap.writeBufferToPixelsSync(writeBuffer)
        pixelMap.readPixelsToBufferSync(readBuffer)
        result = checkArrayBuffer(readBuffer)
      }
      return result
    }

    //测试 pixelMap readPixels/writePixels接口，返回True/False
    //pixelMap: 需要测试的pixelMap
    //pixelMapInterface: readPixels/writePixels/readPixelsSync/writePixelsSync
    //area: 读取/写入的区域
    //type: 接口调用方式，包含 promise、callback、sync，默认为sync
    //errorCase：是否异常参数用例，校验错误码
    const testReadPixelsWritePixels = async (pixelMap:image.PixelMap, pixelMapInterface:string, area:image.PositionArea,
                                             type:string, errorCase:boolean) =>{
      let initialTestReadBuffer: ArrayBuffer = new ArrayBuffer(0)
      if(!errorCase){
        if(pixelMapInterface.includes("read")){
          initialTestReadBuffer = new ArrayBuffer(area.pixels.byteLength)
        }else{
          let bufferArr: Uint8Array = new Uint8Array(area.pixels);
          for (let i = 0; i < bufferArr.length; i++) {
            bufferArr[i] = i + 1;
          }
          initialTestReadBuffer = await readPixels(pixelMap)
        }
      }
      let checkResult = false
      if(type == "promise"){
        await pixelMap[pixelMapInterface](area).then(()=>{
        }).catch((error:BusinessError)=>{
          checkResult = Number(error) == 62980115
        })
      }else if(type=="callback"){
        pixelMap[pixelMapInterface](area, (error : BusinessError) => {
          if (error) {
            checkResult = Number(error) == 62980115
          }
        })
        await sleep(500)
      }else{
        pixelMap[pixelMapInterface](area)
      }
      if(errorCase){
        return checkResult
      }
      const subsequentReadBuffer = await readPixels(pixelMap)
      const subsequentBufferArr = new Uint8Array(subsequentReadBuffer)
      const initialBufferArr = new Uint8Array(initialTestReadBuffer)
      for (let i = 0; i < initialBufferArr.length; i++) {
        if(subsequentBufferArr[i] !== initialBufferArr[i]){
          checkResult = true
          break
        }
      }
      return checkResult
    }

    const readPixels = async (pixelMap:image.PixelMap) => {
      const readArea : image.PositionArea = {
        pixels: new ArrayBuffer(96),
        offset: 0,
        stride: 24,
        region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
      };
      await pixelMap.readPixels(readArea)
      return readArea.pixels
    }


    //测试 pixelMap解码参数 isEditable是否生效, 返回True/False, 当传入的pixelMap对象时解码参数isEditable为true时应返回true，
    // 否则应返回false
    //pixelMap: 需要测试的pixelMap
    const testPixelMapEditable = async (pixelMap:image.PixelMap)=>{
      const testWriteArea : image.PositionArea = {
        pixels: new ArrayBuffer(96),
        offset: 0,
        stride: 24,
        region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
      };
      let bufferArr: Uint8Array = new Uint8Array(testWriteArea.pixels);
      for (let i = 0; i < bufferArr.length; i++) {
        bufferArr[i] = i + 1;
      }
      const result = await testReadPixelsWritePixels(pixelMap, "writePixels", testWriteArea, "promsie", false)
      return result
    }

    //测试 setColorSpace 和 getColorSpace, 返回 true/false
    //pixelMap: 需要测试的pixelMap
    const testPixelMapSetColorSpaceGetColorSpace = (pixelMap:image.PixelMap)=>{
      let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
      let csm: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
      pixelMap.setColorSpace(csm);
      let newCsm = pixelMap.getColorSpace();
      return csm.getColorSpaceName() === newCsm.getColorSpaceName()
    }


    //测试pixelMap release，返回 true/false,
    //pixelMap: 需要测试的pixelMap对象
    //type:接口调用方式，包含 promise、callback
    const testReleasePixelMap = async (testNum:string, pixelMap:image.PixelMap, type:string) =>{
      let imageInfo:image.ImageInfo| undefined | null
      if(type == "promise"){
        await pixelMap.release()
      }else{
        pixelMap.release((error: BusinessError) => {
          if (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: Failed to release pixelmap object ${error}`)
          }
        })
      }
      await sleep(500)
      imageInfo = pixelMap.getImageInfoSync()
      return !imageInfo
    }


    //测试pixelMap接口applyColorSpace,根据输入的目标色彩空间targetColorSpace对图像像素颜色进行色彩空间转换，成功时用例通过
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback
    //targetColorSpace: 目标色彩空间
    let testPixelMapApplyColorSpace = async(done: Function, testNum: string, pixelMap: image.PixelMap, type: string,
                                            targetColorSpace:colorSpaceManager.ColorSpaceManager) => {
      if (type == 'promise') {
        await pixelMap.applyColorSpace(targetColorSpace)
        const csm = pixelMap.getColorSpace()
        expect(targetColorSpace.getColorSpaceName() === csm.getColorSpaceName()).assertTrue();
        done();
      }
      if (type == 'callback') {
        pixelMap.applyColorSpace(targetColorSpace, (error:BusinessError):void => {
          if (error != undefined) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${error}`);
            expect(false).assertTrue();
            done();
          } else {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:Succeeded`);
            const csm = pixelMap.getColorSpace()
            expect(targetColorSpace.getColorSpaceName() === csm.getColorSpaceName()).assertTrue();
            done();
          }
        })
      }
    }

    //测试pixelMap接口scale,根据参数 scaleX scaleY 对pixelmap进行操作，完成后对操作结果宽高进行比例校验，校验通过则用例通过
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback、sync
    //scaleX: 宽度的缩放倍数。
    //scaleY: 高度的缩放倍数。
    let testPixelMapScale = async(done: Function, testNum: string, pixelMap: image.PixelMap, type: string,
                                  scaleX: number, scaleY: number) => {
      let newImageInfo:image.ImageInfo | undefined
      const oldMapImageInfo = pixelMap.getImageInfoSync()
      if (type == 'promise') {
        await pixelMap.scale(scaleX, scaleY)
      } else if (type == 'callback') {
        pixelMap.scale(scaleX, scaleY, async(error: BusinessError) => {
          if (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${error}`);
            expect().assertFail()
            done()
          }
        })
        await sleep(500)
      }else{
        pixelMap.scaleSync(scaleX, scaleY)
      }
      newImageInfo = pixelMap.getImageInfoSync()
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: compareImageInfo${JSON.stringify(newImageInfo)}`)
      const widthCheck = oldMapImageInfo.size.width * scaleX === newImageInfo.size.width
      const heightCheck = oldMapImageInfo.size.height * scaleY === newImageInfo.size.height
      expect(widthCheck && heightCheck)
      done()
    }

    //测试pixelMap rotate 接口，当旋转90、-90度时，使用历史宽高与当前宽高进行校验，校验通过则用例通过
    //testNum 用例编号
    //pixelMap: 测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback、 sync
    //angle: 旋转角度 90/-90, 因无法获取pixelmap对象的角度进行校验，所以此参数只测输入 90/-90
    let testPixelMapRotate = async(done: Function, testNum: string, pixelMap: image.PixelMap,
                                   type: string, angle: number) => {
      const oldImageInfo = await pixelMap.getImageInfo()
      if (type == 'promise') {
        await pixelMap.rotate(angle)
      } else if (type == 'callback') {
        pixelMap.rotate(angle, async (error: BusinessError) => {
          if (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: error${JSON.stringify(error)}`)
            expect().assertFail()
            done()
          }
        })
        await sleep(500)
      }else{
        pixelMap.rotateSync(angle)
      }
      const newImageInfo = await pixelMap.getImageInfo()
      const checkWidth = newImageInfo.size.width === oldImageInfo.size.height
      const checkHeight = newImageInfo.size.height === oldImageInfo.size.width
      expect(checkWidth && checkHeight).assertTrue()
      done()
    }

    //测试pixelMap crop 接口,裁剪完成后与使用参数region指定的size 大小进行校验，校验通过则用例通过
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback、sync
    //region: 裁剪参数
    let testPixelMapCrop = async(done: Function, testNum: string, pixelMap: image.PixelMap,type:string,
                                 region:image.Region) => {
      if (type == 'promise') {
        try {
          await pixelMap.crop(region)
        }catch(error){
          expect(Number(error) == 62980115).assertTrue()
          done();
        }
      } else if (type == 'callback') {
        pixelMap.crop(region, async (error: BusinessError) => {
          if (error) {
            expect(Number(error) == 62980115).assertTrue()
            done();
          }
        })
      }else{
        pixelMap.cropSync(region)
      }
      const newImageInfo = pixelMap.getImageInfoSync()
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: newImageInfo${JSON.stringify(newImageInfo)}`)
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: region${JSON.stringify(region)}`)
      const checkHeight = region.size.height === newImageInfo.size.height
      const checkWidth = region.size.width === newImageInfo.size.width
      expect(checkHeight === checkWidth).assertTrue()
      done()
    }

    //测试pixelMap接口getimageInfo、 getDensity getimageInfo接口返回的图片宽高应于预期宽高相同，
    // getDensity返回的像素密度应与getimageInfo返回的相同，相同时用例通过
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback、sync
    //height: 预期图片高度
    //width: 预期图片宽度
    //format： 预期像素格式
    let testPixelMapGetImageInfo = async(done: Function, testNum: string, pixelMap: image.PixelMap, type: string,
                                         height:number, width:number, format: number) => {
      let compareImageInfo:image.ImageInfo | undefined
      if (type == 'promise') {
        compareImageInfo = await pixelMap.getImageInfo()
      } else if (type == 'callback') {
        pixelMap.getImageInfo( async (error: BusinessError, imageInfo: image.ImageInfo) => {
          if (error) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: testPixelMapGetImageInfo error ${error}`)
            expect().assertFail()
            done()
          } else {
            compareImageInfo = imageInfo
          }
        })
        await sleep(500)
      }else{
        compareImageInfo = pixelMap.getImageInfoSync()
      }
      if(compareImageInfo) {
        hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: compareImageInfo${JSON.stringify(compareImageInfo)}`)
        const getDensity: number = pixelMap.getDensity();
        const pixelMapHeight = compareImageInfo.size.height
        const pixelMapWidth = compareImageInfo.size.width
        const pixelFormat = compareImageInfo.pixelFormat
        const pixelMapdensity = compareImageInfo.density
        expect(pixelMapHeight === height && pixelMapWidth === width).assertTrue()
        expect(pixelFormat === format && getDensity === pixelMapdensity).assertTrue()
        done()
      }
    }

    //测试pixelMap flip 接口，校验宽高，返回 true/false；
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback
    //horizontal：水平翻转，取值为 true/false
    //vertical：垂直翻转，取值为 true/false
    //width：预期图片宽度
    //height：预期图片高度
    const testPixelMapFlip = async(testNum: string, pixelMap: image.PixelMap, type: string,
                                   horizontal: boolean, vertical: boolean, width:number, height:number) => {
      let result = true
      if (type == 'promise') {
        await pixelMap.flip(horizontal, vertical)
      } else if (type == 'callback') {
        pixelMap.flip(horizontal, vertical, (err: BusinessError) => {
          if (err) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: ${err}`)
            result = false
          }
        })
        await sleep(500)
      }else{
        pixelMap.flipSync(horizontal, vertical)
      }
      const imageInfo = pixelMap.getImageInfoSync()
      const imageHeight = imageInfo.size.height
      const imageWidth = imageInfo.size.width
      return imageHeight == height && imageWidth == width && result == true
    }

    //测试pixelMap readPixelsToBuffer接口，空的ArrayBuffer所有位都是0, 写入成功后会出现非0位，以此校验，返回 true/false；
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback
    //dstArray：空的ArrayBuffer
    const testReadPixelsToBuffer = async(testNum:string, pixelMap: image.PixelMap, type: string,
                                         dstArray:ArrayBuffer) =>{
      let interfaceResult = true
      if(type == 'promise') {
        await pixelMap.readPixelsToBuffer(dstArray)
      } else if(type == 'callback') {
        pixelMap.readPixelsToBuffer(dstArray, (err: BusinessError) => {
          if (err) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: ${err}`)
            interfaceResult = false
          }
        })
        await sleep(1000)
      }else{
        pixelMap.readPixelsToBufferSync(dstArray)
      }
      const bufferArr = new Uint8Array(dstArray)
      let checkDataResult = false
      for (let i = 0; i < bufferArr.length; i++) {
        if(bufferArr[i] !== 0){
          checkDataResult = true
          break
        }
      }
      return checkDataResult && interfaceResult
    }

    //测试pixelMap接口 translate, 调用接口后imageInfo不变，返回 true/false；
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback, sync
    //translateX：区域横坐标
    //translateY: 区域纵坐标
    let testPixelMapTranslate = async(testNum: string, pixelMap: image.PixelMap, type: string,
                                      translateX:number, translateY:number) => {
      const initialImageInfo = await pixelMap.getImageInfo()
      let interfaceResult = true
      if (type == 'promise') {
        await pixelMap.translate(translateX, translateY)
      }else if (type == 'callback') {
        pixelMap.translate(translateX, translateY, (err: BusinessError) => {
          if (err) {
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: ${err}`)
            interfaceResult = false
          }
        })
        await sleep(1000)
      }else {
        pixelMap.translateSync(translateX, translateY)
      }
      const imageInfo = await pixelMap.getImageInfo()
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: ${JSON.stringify(imageInfo)}`)
      hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}: ${JSON.stringify(initialImageInfo)}`)
      if (imageInfo.size.width == initialImageInfo.size.width + translateX &&
          imageInfo.size.height == initialImageInfo.size.height + translateY &&
          imageInfo.density == initialImageInfo.density &&
          imageInfo.pixelFormat == initialImageInfo.pixelFormat &&
          imageInfo.mimeType == initialImageInfo.mimeType &&
          imageInfo.isHdr == initialImageInfo.isHdr) {
        return true;
      } else {
        return false;
      }
    }

    //测试pixelMap打包
    //testNum 用例编号
    //pixelMap: 需要测试的pixelMap对象
    //type: 接口的调用类型，包含promise、callback
    //testInterface: 打包调用的接口 packing/packToFile
    //format: 目标格式，例："image/jpeg"、"image/webp" 和 "image/png"。 当前YUV打包格式为 image/jpeg,
    //quality：打包参数，设定输出图片质量的参数，取值范围为0-100
    let pixelMapPacker = async(testNum: string, pixelMap: image.PixelMap, testInterface:string,
                               type: string, format: string, quality: number) => {
      const imagePackerApi : image.ImagePacker = image.createImagePacker();
      let packOpts: image.PackingOption = { format: format, quality: quality }
      let checkResult = false
      if(testInterface === "packing"){
        if (type == 'promise') {
          await imagePackerApi.packing(pixelMap, packOpts).then((data:ArrayBuffer)=>{
            checkResult = true
          }).catch((error:BusinessError)=>{
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${JSON.stringify(error)}`);
            checkResult = false
          })
        }else{
          imagePackerApi.packing(pixelMap, packOpts, async (error:BusinessError, data: ArrayBuffer) => {
            if (error) {
              hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${JSON.stringify(error)}`);
              checkResult = false
            } else {
              checkResult = true
            }
          })
          await sleep(1000)
        }
      }else {
        const uri: string = testContext.cacheDir + "/" + `${testNum}` + "jpg"
        const file: fileIo.File = fs.openSync(uri, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        if(type === "promise"){
          await imagePackerApi.packToFile(pixelMap, file.fd,packOpts).then(()=>{
            checkResult = true
          }).catch((error:BusinessError)=>{
            hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${JSON.stringify(error)}`);
            checkResult = false
          })
        }else{
          imagePackerApi.packToFile(pixelMap, file.fd, packOpts, async(err: BusinessError) => {
            if (err) {
              hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${JSON.stringify(err)}`);
              checkResult = false
            } else {
              checkResult = true
            }
          })
          await sleep(1000)
        }
      }
      return checkResult
    }

    let unMarshallingSuccess = false

    class MySequence implements rpc.Parcelable {
      pixel_map : image.PixelMap;
      constructor(conPixelMap : image.PixelMap) {
        this.pixel_map = conPixelMap;
      }
      marshalling(messageSequence : rpc.MessageSequence) {
        this.pixel_map.marshalling(messageSequence);
        return true;
      }
      unmarshalling(messageSequence : rpc.MessageSequence) {
        image.createPixelMap(new ArrayBuffer(96), {size: { height:4, width: 6}}).then((pixelParcel : image.PixelMap) => {
          pixelParcel.unmarshalling(messageSequence).then(async (pixelMap : image.PixelMap) => {
            this.pixel_map = pixelMap;
            await pixelMap.getImageInfo().then((imageInfo : image.ImageInfo) => {
              console.log("unmarshalling information h: " + imageInfo.size.height + " w: " + imageInfo.size.width);
            })
            unMarshallingSuccess = true
          })
        });
        return true;
      }
    }

    //测试pixelMap marshalling序列化和反序列化
    //pixelMap: 需要测试的pixelMap对象
    //testNum 用例编号
    let testMarshalling = async(done:Function, pixelMap:image.PixelMap, testNum:string) => {
      try {
        let parcelable : MySequence = new MySequence(pixelMap);
        let data : rpc.MessageSequence = rpc.MessageSequence.create();
        data.writeParcelable(parcelable);
        let ret : MySequence = new MySequence(pixelMap);
        data.readParcelable(ret);
        await sleep(500)
        const imageInfoUnmarshalling = await ret.pixel_map.getImageInfo()
        const imageInfo = await pixelMap.getImageInfo()
        expect(unMarshallingSuccess && JSON.stringify(imageInfo) == JSON.stringify(imageInfoUnmarshalling)).assertTrue
        done()
      } catch (error) {
        hilog.info(0x0000, '${testNum}', '%{public}s', `${testNum}:${error}`);
        expect(false).assertTrue()
        done();
      }
    }


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0100
     * @tc.name      : readPixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0100"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg","buffer", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "readPixels", area, "promise", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0200
     * @tc.name      : readPixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0200"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg","fd", false);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "readPixels", area, "promise", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0300
     * @tc.name      : readPixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0300"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg","fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "readPixels", area, "callback", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0400
     * @tc.name      : readPixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0400"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg","fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "readPixels", area, "callback", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0500
     * @tc.name      : readPixelsSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0500', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELS_0500"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "readPixelsSync", area, "sync", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0100
     * @tc.name      : writePixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0100"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg","uri", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "writePixels", area, "promise", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0200
     * @tc.name      : writePixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "writePixels", area, "callback", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0300
     * @tc.name      : writePixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg", "fd", true);
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 1,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "writePixels", area, "callback", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0400
     * @tc.name      : writePixelsSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEPIXELS_0400"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg","fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV12, "writePixelsSync", area, "sync", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0100
     * @tc.name      : writePixels
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","fd", true);
        const checkResult = await testPixelMapEditable(pixelMap_NV12)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0200
     * @tc.name      : writePixels
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","fd", false);
        const checkResult = await testPixelMapEditable(pixelMap_NV12)
        expect(checkResult).assertFalse()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0300
     * @tc.name      : writePixels
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await pixelMap_NV12.applyColorSpace(targetColorSpace)
        const checkResult = await testPixelMapEditable(pixelMap_NV12)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0400
     * @tc.name      : writePixels
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0400"
      try{
        let imageSourceApi = await getImageSource("yuv_test_ete.jpg", "fd");
        let decodingOptions: image.DecodingOptions = {
          desiredPixelFormat: 9,
        };
        let pixelMap_NV12: image.PixelMap = await imageSourceApi.createPixelMap(decodingOptions);
        const checkResult = await testPixelMapEditable(pixelMap_NV12)
        expect(checkResult).assertFalse()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0500
     * @tc.name      : writePixels
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0500', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ISEDITABLE_0500"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","fd", false);
        let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3;
        let targetColorSpace: colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await pixelMap_NV12.applyColorSpace(targetColorSpace)
        const checkResult = await testPixelMapEditable(pixelMap_NV12)
        expect(checkResult).assertFalse()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0100
     * @tc.name      : getImageInfo -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "buffer", true);
        await testPixelMapGetImageInfo(done, testTag, pixelMap_NV12, "promise", 360, 480, 9)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0200
     * @tc.name      : getImageInfo -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        await testPixelMapGetImageInfo(done, testTag, pixelMap_NV12, "callback", 361, 481, 9)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0300
     * @tc.name      : getImageInfoSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_GETIMAGEINFO_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg","uri", true);
        await testPixelMapGetImageInfo(done, testTag, pixelMap_NV12, "sync", 500, 801, 9)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0100
     * @tc.name      : applyColorSpace -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0100"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'promise',  targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0200
     * @tc.name      : applyColorSpace -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0200"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.DCI_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'callback',  targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0300
     * @tc.name      : applyColorSpace -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0300"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg","fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'promise', targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0400
     * @tc.name      : applyColorSpace -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_APPLYCOLORSPACE_0400"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg","fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV12, 'callback', targetColorSpace)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0100
     * @tc.name      : scale -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.scale
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0100"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        await testPixelMapScale(done, testTag, pixelMap_NV12, "promise", 0.5, 2)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0200
     * @tc.name      : scale -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.scale
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0200"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        await testPixelMapScale(done, testTag, pixelMap_NV12, "callback", 0.5, 0.5)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0300
     * @tc.name      : scaleSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.scale
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_SCALE_0300"
      try{
        let pixelMap_NV12 : image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg","fd", true);
        await testPixelMapScale(done, testTag, pixelMap_NV12, "sync", 2, 0.5)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0100
     * @tc.name      : flip -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.flip
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        const result =  await testPixelMapFlip(testTag, pixelMap_NV12, 'promise', false, true, 481, 361)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0200
     * @tc.name      : flip -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.flip
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg","uri", true);
        const result = await testPixelMapFlip(testTag, pixelMap_NV12, "callback", true, false, 801, 500)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0300
     * @tc.name      : flipSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.flip
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_FLIP_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "buffer", true);
        const result = await testPixelMapFlip(testTag, pixelMap_NV12, "sync", true, false, 480, 360)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0100
     * @tc.name      : translate -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.translate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        const checkResult = await testPixelMapTranslate(testTag, pixelMap_NV12, "promise", 3, 1)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0200
     * @tc.name      : translate -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.translate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        const checkResult = await testPixelMapTranslate(testTag, pixelMap_NV12, "callback", 0, 0)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0300
     * @tc.name      : translateSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.translate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_TRANSLATE_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg", "fd", true);
        const checkResult = await testPixelMapTranslate(testTag, pixelMap_NV12, "sync", 1, 3)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0100
     * @tc.name      : rotate -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.rotate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        await testPixelMapRotate(done, testTag, pixelMap_NV12, "promise", 90)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0200
     * @tc.name      : rotate -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.rotate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg", "fd", true);
        await testPixelMapRotate(done, testTag, pixelMap_NV12, "callback", -90)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0300
     * @tc.name      : rotateSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.rotate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_ROTATE_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        await testPixelMapRotate(done, testTag, pixelMap_NV12, "sync", 90)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_CROP_0100
     * @tc.name      : crop -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_CROP_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_CROP_0100"
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV12, "promise", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_CROP_0200
     * @tc.name      : crop -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_CROP_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV12_CROP_0200'
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg","fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV12, "callback", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_CROP_0300
     * @tc.name      : crop -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_CROP_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV12_CROP_0300'
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV12, "promise", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_CROP_0400
     * @tc.name      : crop -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_CROP_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV12_CROP_0400'
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV12, "callback", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_CROP_0500
     * @tc.name      : crop -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_CROP_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV12_CROP_0500'
      try{
        let region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV12, "promise", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_CROP_0600
     * @tc.name      : crop -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_CROP_0600', Level.LEVEL0, async (done:Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV12_CROP_0600'
      try{
        let region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV12, "callback", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_CROP_0700
     * @tc.name      : cropSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_CROP_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV12_CROP_0700'
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV12, "sync", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_PACKING_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKING_0100', Level.LEVEL0,  async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_PACKING_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "buffer", true);
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV12, "packing", 'promise', 'image/webp', 100)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_PACKING_0200
     * @tc.name      : packing -callback
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKING_0200', Level.LEVEL0,  async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_PACKING_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_eto.jpg", "rawfile",  true);
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV12, "packing", 'callback', 'image/jpeg', 0);
        expect(checkResult).assertTrue();
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_0100
     * @tc.name      : packToFile -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_0100', Level.LEVEL0,  async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg", "uri", true);
        const checkResult =  await pixelMapPacker(testTag, pixelMap_NV12, "packToFile", 'promise', 'image/jpeg', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_0200
     * @tc.name      : packToFile  -callback
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packToFile
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_0200', Level.LEVEL0,  async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV12_PACKTOFILE_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg", "fd", true);
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV12, "packToFile", 'callback', 'image/png', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_COLORSPACE_0100
     * @tc.name      : setColorSpace -sync
     * @tc.desc      : 1.setColorSpace
     *                 2.getColorSpace
     *                 3.getColorSpaceName
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_COLORSPACE_0100', Level.LEVEL0,  async (done:Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV12_COLORSPACE_0100'
      try {
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        const checkResult = testPixelMapSetColorSpaceGetColorSpace(pixelMap_NV12)
        expect(checkResult).assertTrue();
        done()
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_MARSHALLING_0100
     * @tc.name      : marshalling
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 2.MySequence
     *                 3.rpc.MessageSequence.writeParcelable
     *                 4.rpc.MessageSequence.readParcelable
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_MARSHALLING_0100', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV12_MARSHALLING_0100"
      try {
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        await testMarshalling(done, pixelMap_NV12, testTag);
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_RELEASE_0100
     * @tc.name      : release -promise
     * @tc.desc      : 1.createPixelMap
     *                 2.pixelMap.release
     *                 3.pixelMap.getImageInfoSync()
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_RELEASE_0100', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV12_RELEASE_0100"
      try {
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        const result = await testReleasePixelMap(testTag, pixelMap_NV12, "promise")
        expect(result).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_RELEASE_0200
     * @tc.name      : release -callback
     * @tc.desc      : 1.createPixelMap
     *                 2.pixelMap.release
     *                 3.pixelMap.getImageInfoSync()
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_RELEASE_0200', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV12_RELEASE_0200"
      try {
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        const result = await testReleasePixelMap(testTag, pixelMap_NV12, "callback")
        expect(result).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0100
     * @tc.name      : readPixelsToBuffer -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixelsToBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","buffer", true);
        const readBuffer = new ArrayBuffer(260000)
        const checkResult = await testReadPixelsToBuffer(testTag, pixelMap_NV12, 'promise', readBuffer)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0200
     * @tc.name      : readPixelsToBuffer -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixelsToBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg","uri", true);
        const readBuffer = new ArrayBuffer(260000)
        const checkResult = await testReadPixelsToBuffer(testTag, pixelMap_NV12, 'callback', readBuffer)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0300
     * @tc.name      : readPixelsToBufferSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixelsToBufferSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_READPIXELSTOBUFFER_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        const readBuffer = new ArrayBuffer(260000)
        const checkResult = await testReadPixelsToBuffer(testTag, pixelMap_NV12, 'sync', readBuffer)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0100
     * @tc.name      : writeBufferToPixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writeBufferToPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0100"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ete.jpg", "fd", true);
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV12, 'promise')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0200
     * @tc.name      : writeBufferToPixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixelsToBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0200"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_oto.jpeg","uri", true);
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV12, 'callback')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0300
     * @tc.name      : writeBufferToPixelsSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixelsToBufferSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_WRITEBUFFERTOPIXELS_0300"
      try{
        let pixelMap_NV12: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV12, 'sync')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0100
     * @tc.name      : writePixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0100"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg","uri", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "writePixels", area, "promise", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0200
     * @tc.name      : writePixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "writePixels", area, "callback", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0300
     * @tc.name      : writePixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0300"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg", "fd", true);
        const area: image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 1,
          stride: 8,
          region: { size: { height: 2, width: 2 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "writePixels", area, "callback", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0400
     * @tc.name      : writePixelsSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEPIXELS_0400"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "writePixelsSync", area, "sync", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0100
     * @tc.name      : readPixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0100"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg","uri", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "readPixels", area, "promise", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0200
     * @tc.name      : readPixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0200"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "readPixels", area, "promise", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0300
     * @tc.name      : readPixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0300"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg","fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "readPixels", area, "callback", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0400
     * @tc.name      : readPixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0400"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg","rawfile", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(0),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "readPixels", area, "callback", true)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0500
     * @tc.name      : readPixelsSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0500', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELS_0500"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg", "fd", true);
        const area : image.PositionArea = {
          pixels: new ArrayBuffer(96),
          offset: 0,
          stride: 24,
          region: { size: { height: 4, width: 6 }, x: 0, y: 0 }
        };
        const result = await testReadPixelsWritePixels(pixelMap_NV21, "readPixelsSync", area, "sync", false)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0100
     * @tc.name      : getImageInfo -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg","uri", true);
        await testPixelMapGetImageInfo(done, testTag, pixelMap_NV21, "promise", 360, 480, 8)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0200
     * @tc.name      : getImageInfo -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg","uri", true);
        await testPixelMapGetImageInfo(done, testTag, pixelMap_NV21, "callback", 361, 481, 8)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0300
     * @tc.name      : getImageInfoSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_GETIMAGEINFO_0300"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg","uri", true);
        await testPixelMapGetImageInfo(done, testTag, pixelMap_NV21, "sync", 500, 801, 8)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0100
     * @tc.name      : applyColorSpace -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0100"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg", "buffer", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'promise', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0200
     * @tc.name      : applyColorSpace -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0200"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.DCI_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'callback', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0300
     * @tc.name      : applyColorSpace -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0300"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'promise', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0400
     * @tc.name      : applyColorSpace -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.applyColorSpace
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_APPLYCOLORSPACE_0400"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg","fd", true);
        let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998;
        let targetColorSpace : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
        await testPixelMapApplyColorSpace(done, testTag, pixelMap_NV21, 'callback', targetColorSpace);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0100
     * @tc.name      : scale -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.scale
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0100"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        await testPixelMapScale(done, testTag, pixelMap_NV21, "promise", 2, 2)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0200
     * @tc.name      : scale -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.scale
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0200', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0200"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        await testPixelMapScale(done, testTag, pixelMap_NV21, "callback", 0.5, 2)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0300
     * @tc.name      : scaleSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.scale
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_SCALE_0300"
      try{
        let pixelMap_NV21 : image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        await testPixelMapScale(done, testTag, pixelMap_NV21, "sync", 2, 0.5)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0100
     * @tc.name      : flip -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.flip
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "rawfile", true);
        const result = await testPixelMapFlip(testTag, pixelMap_NV21, 'promise', false, false, 801, 500)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0200
     * @tc.name      : flip -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.flip
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0200', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        const result = await testPixelMapFlip(testTag, pixelMap_NV21, 'callback', true, true, 800, 501)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0300
     * @tc.name      : flipSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.flip
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0300', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_FLIP_0300"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg","uri", true);
        const result = await testPixelMapFlip(testTag, pixelMap_NV21, 'sync', true, true, 801, 500)
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0100
     * @tc.name      : translate -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.translate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg","fd", true);
        const checkResult = await testPixelMapTranslate(testTag, pixelMap_NV21, 'promise', 3, 1)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0200
     * @tc.name      : translate -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.translate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0200', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        const checkResult = await testPixelMapTranslate(testTag, pixelMap_NV21, 'callback', 0, 0)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0300
     * @tc.name      : translateSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.translate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_TRANSLATE_0300"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg","fd", true);
        const checkResult = await testPixelMapTranslate(testTag, pixelMap_NV21, 'sync', 1, 1)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0100
     * @tc.name      : rotate -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.rotate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0100', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg","fd", true);
        await testPixelMapRotate(done, testTag, pixelMap_NV21, "promise", 90)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0200
     * @tc.name      : rotate -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.rotate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0200', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        await testPixelMapRotate(done, testTag, pixelMap_NV21, "callback", -90)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0300
     * @tc.name      : rotateSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.rotate
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0300', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_ROTATE_0300"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg","fd", true);
        await testPixelMapRotate(done, testTag, pixelMap_NV21, "sync", -90)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_CROP_0100
     * @tc.name      : crop -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_CROP_0100', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_CROP_0100"
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg","fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV21, "promise", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_CROP_0200
     * @tc.name      : crop -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_CROP_0200', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_CROP_0200"
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg","fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV21, "callback", region)
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_CROP_0300
     * @tc.name      : crop -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_CROP_0300', Level.LEVEL0, async (done: Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_CROP_0300"
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV21, "promise", region);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_CROP_0400
     * @tc.name      : crop -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_CROP_0400', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_CROP_0400"
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: -1, width: 3 } };
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV21, "callback", region);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_CROP_0500
     * @tc.name      : crop -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_CROP_0500', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_CROP_0500"
      try{
        let region: image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV21, "promise", region);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_CROP_0600
     * @tc.name      : crop -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_CROP_0600', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_CROP_0600"
      try{
        let region : image.Region = { x: -1, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV21, "callback", region);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_CROP_0700
     * @tc.name      : cropSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.crop
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_CROP_0700', Level.LEVEL0, async (done: Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_CROP_0700"
      try{
        let region : image.Region = { x: 0, y: 0, size: { height: 2, width: 3 } };
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_eto.jpg", "fd", true);
        await testPixelMapCrop(done, testTag, pixelMap_NV21, "sync", region);
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_PACKING_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKING_0100', Level.LEVEL0,  async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKING_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV21, "packing", 'promise', 'image/png', 22);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_PACKING_0200
     * @tc.name      : packing -callback
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKING_0200', Level.LEVEL0,  async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKING_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV21, "packing", 'callback', 'image/jpeg', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_0100
     * @tc.name      : packing -promise
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_0100', Level.LEVEL0,  async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        const checkResult =  await pixelMapPacker(testTag, pixelMap_NV21, "packToFile", 'promise', 'image/jpeg', 98);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_0200
     * @tc.name      : packing -callback
     * @tc.desc      : 1.modifyImageProperty
     *                 2.packing
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_0200', Level.LEVEL0,  async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_PACKTOFILE_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        const checkResult = await pixelMapPacker(testTag, pixelMap_NV21, "packToFile", 'callback', 'image/webp', 100);
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_COLORSPACE_0100
     * @tc.name      : packing -callback
     * @tc.desc      : 1.setColorSpace
     *                 2.getColorSpace
     *                 3.getColorSpaceName
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_COLORSPACE_0100', Level.LEVEL0,  async (done:Function) => {
      const testTag = 'SUB_MULTIMEDIA_IMAGE_NV21_COLORSPACE_0100'
      try {
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ote.jpg", "fd", true);
        const checkResult = testPixelMapSetColorSpaceGetColorSpace(pixelMap_NV21)
        expect(checkResult).assertTrue();
        done()
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_MARSHALLING_0100
     * @tc.name      : marshalling
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 2.MySequence
     *                 3.rpc.MessageSequence.writeParcelable
     *                 4.rpc.MessageSequence.readParcelable
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_MARSHALLING_0100', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_MARSHALLING_0100"
      try {
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        await testMarshalling(done, pixelMap_NV21, testTag);
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_RELEASE_0100
     * @tc.name      : release -promise
     * @tc.desc      : 1.pixelMap.release
     *                 2.pixelMap.getImageInfoSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_RELEASE_0100', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_RELEASE_0100"
      try {
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        const result = await testReleasePixelMap(testTag, pixelMap_NV21, "promise")
        expect(result).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_RELEASE_0200
     * @tc.name      : release - callback
     * @tc.desc      : 1.pixelMap.release
     *                 2.pixelMap.getImageInfoSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_RELEASE_0200', Level.LEVEL0, async (done:Function) => {
      const testTag ="SUB_MULTIMEDIA_IMAGE_NV21_RELEASE_0200"
      try {
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg", "fd", true);
        const result = await testReleasePixelMap(testTag, pixelMap_NV21, "callbcak")
        expect(result).assertTrue()
        done()
      } catch (error) {
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0100
     * @tc.name      : readPixelsToBuffer -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixelsToBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg","fd", true);
        const readBuffer = new ArrayBuffer(260000)
        const checkResult = await testReadPixelsToBuffer(testTag, pixelMap_NV21, 'promise', readBuffer)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0200
     * @tc.name      : readPixelsToBuffer -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixelsToBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg","uri", true);
        const readBuffer = new ArrayBuffer(260000)
        const checkResult = await testReadPixelsToBuffer(testTag, pixelMap_NV21, 'callback', readBuffer)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0300
     * @tc.name      : readPixelsToBufferSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.readPixelsToBufferSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_READPIXELSTOBUFFER_0300"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg", "fd", true);
        const readBuffer = new ArrayBuffer(260000)
        const checkResult = await testReadPixelsToBuffer(testTag, pixelMap_NV21, 'sync', readBuffer)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0100
     * @tc.name      : writeBufferToPixels -promise
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writeBufferToPixels
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0100"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_ete.jpg", "fd", true);
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV21, 'promise')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0200
     * @tc.name      : writeBufferToPixels -callback
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixelsToBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0200"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV21("yuv_test_oto.jpeg","uri", true);
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV21, 'callback')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0300
     * @tc.name      : writeBufferToPixelsSync
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.writePixelsToBufferSync
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_WRITEBUFFERTOPIXELS_0300"
      try{
        let pixelMap_NV21: image.PixelMap = await getPixMap_NV12("yuv_test_ote.jpg", "fd", true);
        const result = await testWriteBufferToPixels(testTag, pixelMap_NV21, 'sync')
        expect(result).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0100
     * @tc.name      : sourceDensity_fitDensity
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0100"
      try{
        const pixelMap = await getDensityOptionPixelMap("yuv_test_ete.jpg", 9, 0, 0, false)
        const checkResult = await checkNzDensity(testTag, pixelMap, 0, 0, 480, 360)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0200
     * @tc.name      : sourceDensity_fitDensity
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0200"
      try{
        const pixelMap = await getDensityOptionPixelMap("yuv_test_eto.jpg", 9, 120, 240, true)
        const checkResult = await checkNzDensity(testTag, pixelMap, 120, 240, 800, 501)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0300
     * @tc.name      : sourceDensity_fitDensity
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV21_DENSITYOPTION_0300"
      try{
        const pixelMap = await getDensityOptionPixelMap("yuv_test_oto.jpeg", 9, 0, 0, true)
        const checkResult = await checkNzDensity(testTag, pixelMap, 0, 0, 481, 361)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0100
     * @tc.name      : sourceDensity_fitDensity
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0100', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0100"
      try{
        const pixelMap = await getDensityOptionPixelMap("yuv_test_ote.jpg", 8, 0, 0, false)
        const checkResult = await checkNzDensity(testTag, pixelMap, 0, 0, 801, 500)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0200
     * @tc.name      : sourceDensity_fitDensity
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0200', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0200"
      try{
        const pixelMap = await getDensityOptionPixelMap("yuv_test_ete.jpg", 8, 120, 240, true)
        const checkResult = await checkNzDensity(testTag, pixelMap, 120, 240, 480, 360)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0300
     * @tc.name      : sourceDensity_fitDensity
     * @tc.desc      : 1.createImageSource
     *                 2.createPixelMap
     *                 3.PixelMap.getImageInfo
     * @tc.size      : MediumTest
     * @tc.type      : Functional
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0300', Level.LEVEL0, async (done:Function) => {
      const testTag = "SUB_MULTIMEDIA_IMAGE_NV12_DENSITYOPTION_0300"
      try{
        const pixelMap = await getDensityOptionPixelMap("yuv_test_oto.jpeg", 8, 0, 0, true)
        const checkResult = await checkNzDensity(testTag, pixelMap, 0, 0, 481, 361)
        expect(checkResult).assertTrue()
        done()
      }catch(error){
        hilog.info(0x0000, testTag, `${testTag} Test exception  ` + error);
        expect().assertFail();
        done();
      }
    })
  })
}
