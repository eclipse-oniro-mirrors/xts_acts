import CrateImageSourceTest from "./image/creatImageSource/CreatImageSource.test";
import ImageGetComponentSupp from "./image/getComponent/GetComponent.test";
import AuxiliaryPictureGetAuxiliaryPictureInfoTest from "./Picture/Picture.test";
import CrateImageCreatorTest from "./ImageCreator/ImageCreator.test";
import MakerNoteHuaweiMetadataTest from "./property/Property.test";
import ImageReceiverSupp from "./ImageReceiver/ImageReceiver.test";
import ImageExifMetadataStaticTest from './ExifMetadata.test'
import metaDataStaticTest from "./image/Metadata.test";
import ImageAuxiliaryPictureGetMetadataStaticTest from "./image/AuxiliaryPicture.test";
import ImagePackerStaticTest from "./image/ImagePacker.test";

export default function testsuite(): void {
  metaDataStaticTest();
  ImageAuxiliaryPictureGetMetadataStaticTest();
  ImagePackerStaticTest();
  ImageExifMetadataStaticTest();
  AuxiliaryPictureGetAuxiliaryPictureInfoTest();
  CrateImageCreatorTest();
  MakerNoteHuaweiMetadataTest();
  ImageReceiverSupp();
  CrateImageSourceTest();
  ImageGetComponentSupp();
}