/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import image from '@ohos.multimedia.image';
import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import fs from '@ohos.file.fs';

const TAG = 'ImageExifMetadataStaticTest:'

export default function ImageExifMetadataStaticTest() {
  let filesDir: string | undefined | null;
  let filePath: string = '';
  let fdNumber: int;
  const getFd = (fileName: string): int => {
    filePath = filesDir + "/" + fileName;
    console.info("image filePath:" + filePath);
    const file = fs.openSync(filePath);
    fdNumber = file.fd as int;
    return fdNumber;
  };
  describe('ImageExifMetadataStaticTest', (): void => {
    beforeAll(() => {
      filesDir = Hypium.get('pathDir') as string | undefined | null;
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.number     SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_STATIC_0100
     * @tc.name       SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_STATIC_0100
     * @tc.desc       Metadata -ExifMetadata -getAllProperties -返回值为undefined
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_STATIC_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
      const testName = 'SUB_IMAGE_METADATA_EXIF_META_DATA_GET_ALL_PROPERTIES_STATIC_0100';
      try {
        const testArrayBufferUint8: Uint8Array = new Uint8Array([48, 50, 49, 48]);
        const testExifArrayBuffer: ArrayBuffer = testArrayBufferUint8.buffer as ArrayBuffer;
        const testArrayBufferUint8_1: Uint8Array = new Uint8Array([1]);
        const testExifArrayBuffer_1: ArrayBuffer = testArrayBufferUint8_1.buffer as ArrayBuffer;
        let testExifMetadata: image.ExifMetadata = image.ExifMetadata.createInstance();
        testExifMetadata.newSubfileType = 5;
        testExifMetadata.subfileType = 3;
        testExifMetadata.imageWidth = 65535;
        testExifMetadata.imageLength = 65535;
        testExifMetadata.bitsPerSample = [65535,65535,65535];
        testExifMetadata.compression = 32773;
        testExifMetadata.photometricInterpretation = 1;
        testExifMetadata.imageDescription = '@  @';
        testExifMetadata.make = 'APPLE';
        testExifMetadata.model = '%s \\0';
        testExifMetadata.stripOffsets = [456];
        testExifMetadata.orientation = image.Orientation.TOP_LEFT;
        testExifMetadata.samplesPerPixel = 65535;
        testExifMetadata.rowsPerStrip = 345;
        testExifMetadata.stripByteCounts = [345];
        testExifMetadata.xResolution = 31/1;
        testExifMetadata.yResolution = 31/1;
        testExifMetadata.planarConfiguration = 2;
        testExifMetadata.resolutionUnit = 3;
        testExifMetadata.transferFunction = 'abc';
        testExifMetadata.software = '%s \\0';
        testExifMetadata.dateTime = '1900:01:01';
        testExifMetadata.artist = '%s \\0';
        testExifMetadata.whitePoint = [252, 1];
        testExifMetadata.primaryChromaticities = [31];
        testExifMetadata.photoMode = 13;
        testExifMetadata.yCbCrCoefficients = [1.5,2.0,3.0];
        testExifMetadata.yCbCrSubSampling = [4,5];
        testExifMetadata.yCbCrPositioning = 2;
        testExifMetadata.referenceBlackWhite = [3,255,0,255,0,255];
        testExifMetadata.copyright = 'joseph';
        testExifMetadata.exposureTime = 1/60;
        testExifMetadata.fNumber = 1/30;
        testExifMetadata.exposureProgram = 8;
        testExifMetadata.spectralSensitivity = '1234';
        testExifMetadata.gpsVersionID = [2, 2, 0, 1];
        testExifMetadata.gpsLatitudeRef = 'S';
        testExifMetadata.gpsLatitude = [38.0, 0, 0];
        testExifMetadata.gpsLongitudeRef = 'W';
        testExifMetadata.gpsLongitude = [38, 0, 0];
        testExifMetadata.gpsAltitudeRef = 1;
        testExifMetadata.gpsAltitude = 1.00;
        testExifMetadata.gpsTimestamp = [12, 54, 20];
        testExifMetadata.gpsSatellites = 'a b c';
        testExifMetadata.gpsStatus = 'V';
        testExifMetadata.gpsMeasureMode = '3';
        testExifMetadata.gpsDop = 1.5;
        testExifMetadata.gpsSpeedRef = 'K';
        testExifMetadata.gpsSpeed = 0;
        testExifMetadata.gpsTrackRef = 'M';
        testExifMetadata.gpsTrack = 3.5;
        testExifMetadata.gpsImgDirectionRef = 'T';
        testExifMetadata.gpsImgDirection = 2.5;
        testExifMetadata.gpsMapDatum = '%s\\0';
        testExifMetadata.gpsDestLatitudeRef = 'S';
        testExifMetadata.gpsDestLatitude = [0, 0, 0];
        testExifMetadata.gpsDestLongitudeRef = 'W';
        testExifMetadata.gpsDestLongitude = [0, 0, 0];
        testExifMetadata.gpsDestBearingRef = 'M';
        testExifMetadata.gpsDestBearing = 2.5;
        testExifMetadata.gpsDestDistanceRef = 'K';
        testExifMetadata.gpsDestDistance = 2.5;
        testExifMetadata.gpsProcessingMethod = 'XXX';
        testExifMetadata.gpsAreaInformation = 'client';
        testExifMetadata.gpsDateStamp = '1900:01:01';
        testExifMetadata.gpsDifferential = 1;
        testExifMetadata.gpsHPositioningError = 0.5;
        testExifMetadata.isoSpeedRatings = 3200;
        testExifMetadata.photographicSensitivity = [3200];
        testExifMetadata.oecf = testExifArrayBuffer;
        testExifMetadata.sensitivityType = 0;
        testExifMetadata.standardOutputSensitivity = 1000;
        testExifMetadata.recommendedExposureIndex = 2147483647;
        testExifMetadata.isoSpeedLatitudeyyy = 123;
        testExifMetadata.isoSpeedLatitudezzz = 123;
        testExifMetadata.exifVersion = "Exif Version 2.1";
        testExifMetadata.dateTimeOriginal = '1900:01:01 00:00:00';
        testExifMetadata.dateTimeDigitized = '1900:01:01 00:00:00';
        testExifMetadata.offsetTime = '2023:01:25';
        testExifMetadata.offsetTimeOriginal = 'ject';
        testExifMetadata.offsetTimeDigitized = 'cirtize';
        testExifMetadata.componentsConfiguration = "Y R G B";
        testExifMetadata.compressedBitsPerPixel = 25;
        testExifMetadata.shutterSpeedValue = 3/2;
        testExifMetadata.apertureValue = 16;
        testExifMetadata.brightnessValue = 6/5;
        testExifMetadata.exposureBiasValue = 4;
        testExifMetadata.maxApertureValue = 8/5;
        testExifMetadata.subjectDistance = 1/2;
        testExifMetadata.meteringMode = 0;
        testExifMetadata.lightSource = 1;
        testExifMetadata.flash = 95;
        testExifMetadata.focalLength = 31.0;
        testExifMetadata.subjectArea = [45, 23];
        testExifMetadata.makerNote = testExifArrayBuffer;
        testExifMetadata.userComment = "place for user comments";
        testExifMetadata.subsecTime = '427000';
        testExifMetadata.subsecTimeOriginal = '123456';
        testExifMetadata.subsecTimeDigitized = '999999';
        testExifMetadata.flashpixVersion = "FlashPix Version 1.0";
        testExifMetadata.colorSpace = 2;
        testExifMetadata.pixelXDimension = 0;
        testExifMetadata.pixelYDimension = 0;
        testExifMetadata.relatedSoundFile = 'abc';
        testExifMetadata.flashEnergy = 2.5;
        testExifMetadata.spatialFrequencyResponse = testExifArrayBuffer;
        testExifMetadata.focalPlaneXResolution = 102;
        testExifMetadata.focalPlaneYResolution = 81;
        testExifMetadata.focalPlaneResolutionUnit = 3;
        testExifMetadata.subjectLocation = [23, 112];
        testExifMetadata.exposureIndex = 2.5;
        testExifMetadata.sensingMethod = 8;
        testExifMetadata.fileSource = testExifArrayBuffer_1;
        testExifMetadata.sceneType = testExifArrayBuffer_1;
        testExifMetadata.cfaPattern = testExifArrayBuffer;
        testExifMetadata.customRendered = 1;
        testExifMetadata.exposureMode = 2;
        testExifMetadata.whiteBalance = 0;
        testExifMetadata.digitalZoomRatio = 23/1;
        testExifMetadata.focalLengthIn35mmFilm = 12;
        testExifMetadata.sceneCaptureType = 3;
        testExifMetadata.gainControl = 4;
        testExifMetadata.contrast = 2;
        testExifMetadata.saturation = 2;
        testExifMetadata.sharpness = 2;
        testExifMetadata.deviceSettingDescription = testExifArrayBuffer;
        testExifMetadata.subjectDistanceRange = 3;
        testExifMetadata.imageUniqueId = 'Image Unique ID';
        testExifMetadata.cameraOwnerName = 'joseph';
        testExifMetadata.bodySerialNumber = 'xoinc';
        testExifMetadata.lensSpecification = [0.75,2.5,1.5,2.5];
        testExifMetadata.lensMake = 'plex';
        testExifMetadata.lensModel = 'world';
        testExifMetadata.lensSerialNumber = 'root';
        testExifMetadata.compositeImage = 3;
        testExifMetadata.sourceImageNumberOfCompositeImage = [11, 23];
        testExifMetadata.sourceExposureTimesOfCompositeImage = testExifArrayBuffer;
        testExifMetadata.gamma = 1.5;
        testExifMetadata.jpegInterchangeFormat = 2798;
        testExifMetadata.jpegInterchangeFormatLength = 4;

        const imageMetadata: image.ImageMetadata = {
          exifMetadata: testExifMetadata
        };
        await getFd('test_exif_v2.jpg');
        let imageSourceApi: image.ImageSource|undefined = await image.createImageSource(fdNumber);
        await imageSourceApi?.writeImageMetadata(imageMetadata);
        let metaData = await imageSourceApi?.readImageMetadata();
        console.info(TAG,testName,`testWriteImageMetadata result is:`,metaData!.exifMetadata);
        if (metaData != undefined && metaData.exifMetadata != undefined) {
          let New_metaData: image.ExifMetadata = await metaData!.exifMetadata!.clone();
          console.info(TAG, testName, 'makerNoteHuaweiMetadata clone Success.');
          expect(New_metaData != undefined).assertTrue();
          expect(New_metaData!.newSubfileType).assertEqual(metaData!.exifMetadata!.newSubfileType);
          expect(New_metaData!.subfileType).assertEqual(metaData!.exifMetadata!.subfileType);
          expect(New_metaData!.imageWidth).assertEqual(metaData!.exifMetadata!.imageWidth);
          expect(New_metaData!.imageLength).assertEqual(metaData!.exifMetadata!.imageLength);
          expect(New_metaData!.bitsPerSample).assertDeepEquals(metaData!.exifMetadata!.bitsPerSample);
          expect(New_metaData!.compression).assertEqual(metaData!.exifMetadata!.compression);
          expect(New_metaData!.photometricInterpretation).assertEqual(metaData!.exifMetadata!.photometricInterpretation);
          expect(New_metaData!.imageDescription).assertEqual(metaData!.exifMetadata!.imageDescription);
          expect(New_metaData!.make).assertEqual(metaData!.exifMetadata!.make);
          expect(New_metaData!.model).assertEqual(metaData!.exifMetadata!.model);
          expect(New_metaData!.stripOffsets).assertDeepEquals(metaData!.exifMetadata!.stripOffsets);
          expect(New_metaData!.orientation).assertEqual(metaData!.exifMetadata!.orientation);
          expect(New_metaData!.samplesPerPixel).assertEqual(metaData!.exifMetadata!.samplesPerPixel);
          expect(New_metaData!.rowsPerStrip).assertEqual(metaData!.exifMetadata!.rowsPerStrip);
          expect(New_metaData!.stripByteCounts).assertDeepEquals(metaData!.exifMetadata!.stripByteCounts);
          expect(New_metaData!.xResolution).assertEqual(metaData!.exifMetadata!.xResolution);
          expect(New_metaData!.yResolution).assertEqual(metaData!.exifMetadata!.yResolution);
          expect(New_metaData!.planarConfiguration).assertEqual(metaData!.exifMetadata!.planarConfiguration);
          expect(New_metaData!.resolutionUnit).assertEqual(metaData!.exifMetadata!.resolutionUnit);
          expect(New_metaData!.transferFunction).assertEqual(metaData!.exifMetadata!.transferFunction);
          expect(New_metaData!.software).assertEqual(metaData!.exifMetadata!.software);
          expect(New_metaData!.dateTime).assertEqual(metaData!.exifMetadata!.dateTime);
          expect(New_metaData!.artist).assertEqual(metaData!.exifMetadata!.artist);
          expect(New_metaData!.whitePoint).assertDeepEquals(metaData!.exifMetadata!.whitePoint);
          expect(New_metaData!.primaryChromaticities).assertDeepEquals(metaData!.exifMetadata!.primaryChromaticities);
          expect(New_metaData!.photoMode).assertEqual(metaData!.exifMetadata!.photoMode);
          expect(New_metaData!.yCbCrCoefficients).assertDeepEquals(metaData!.exifMetadata!.yCbCrCoefficients);
          expect(New_metaData!.yCbCrSubSampling).assertDeepEquals(metaData!.exifMetadata!.yCbCrSubSampling);
          expect(New_metaData!.yCbCrPositioning).assertEqual(metaData!.exifMetadata!.yCbCrPositioning);
          expect(New_metaData!.referenceBlackWhite).assertDeepEquals(metaData!.exifMetadata!.referenceBlackWhite);
          expect(New_metaData!.copyright).assertEqual(metaData!.exifMetadata!.copyright);
          expect(New_metaData!.exposureTime).assertEqual(metaData!.exifMetadata!.exposureTime);
          expect(New_metaData!.fNumber).assertEqual(metaData!.exifMetadata!.fNumber);
          expect(New_metaData!.exposureProgram).assertEqual(metaData!.exifMetadata!.exposureProgram);
          expect(New_metaData!.spectralSensitivity).assertEqual(metaData!.exifMetadata!.spectralSensitivity);
          expect(New_metaData!.gpsVersionID).assertDeepEquals(metaData!.exifMetadata!.gpsVersionID);
          expect(New_metaData!.gpsLatitudeRef).assertEqual(metaData!.exifMetadata!.gpsLatitudeRef);
          expect(New_metaData!.gpsLatitude).assertDeepEquals(metaData!.exifMetadata!.gpsLatitude);
          expect(New_metaData!.gpsLongitudeRef).assertEqual(metaData!.exifMetadata!.gpsLongitudeRef);
          expect(New_metaData!.gpsLongitude).assertDeepEquals(metaData!.exifMetadata!.gpsLongitude);
          expect(New_metaData!.gpsAltitudeRef).assertEqual(metaData!.exifMetadata!.gpsAltitudeRef);
          expect(New_metaData!.gpsAltitude).assertEqual(metaData!.exifMetadata!.gpsAltitude);
          expect(New_metaData!.gpsTimestamp).assertDeepEquals(metaData!.exifMetadata!.gpsTimestamp);
          expect(New_metaData!.gpsSatellites).assertEqual(metaData!.exifMetadata!.gpsSatellites);
          expect(New_metaData!.gpsStatus).assertEqual(metaData!.exifMetadata!.gpsStatus);
          expect(New_metaData!.gpsMeasureMode).assertEqual(metaData!.exifMetadata!.gpsMeasureMode);
          expect(New_metaData!.gpsDop).assertEqual(metaData!.exifMetadata!.gpsDop);
          expect(New_metaData!.gpsSpeedRef).assertEqual(metaData!.exifMetadata!.gpsSpeedRef);
          expect(New_metaData!.gpsSpeed).assertEqual(metaData!.exifMetadata!.gpsSpeed);
          expect(New_metaData!.gpsTrackRef).assertEqual(metaData!.exifMetadata!.gpsTrackRef);
          expect(New_metaData!.gpsTrack).assertEqual(metaData!.exifMetadata!.gpsTrack);
          expect(New_metaData!.gpsImgDirectionRef).assertEqual(metaData!.exifMetadata!.gpsImgDirectionRef);
          expect(New_metaData!.gpsImgDirection).assertEqual(metaData!.exifMetadata!.gpsImgDirection);
          expect(New_metaData!.gpsMapDatum).assertEqual(metaData!.exifMetadata!.gpsMapDatum);
          expect(New_metaData!.gpsDestLatitudeRef).assertEqual(metaData!.exifMetadata!.gpsDestLatitudeRef);
          expect(New_metaData!.gpsDestLatitude).assertDeepEquals(metaData!.exifMetadata!.gpsDestLatitude);
          expect(New_metaData!.gpsDestLongitudeRef).assertEqual(metaData!.exifMetadata!.gpsDestLongitudeRef);
          expect(New_metaData!.gpsDestLongitude).assertDeepEquals(metaData!.exifMetadata!.gpsDestLongitude);
          expect(New_metaData!.gpsDestBearingRef).assertEqual(metaData!.exifMetadata!.gpsDestBearingRef);
          expect(New_metaData!.gpsDestBearing).assertEqual(metaData!.exifMetadata!.gpsDestBearing);
          expect(New_metaData!.gpsDestDistanceRef).assertEqual(metaData!.exifMetadata!.gpsDestDistanceRef);
          expect(New_metaData!.gpsDestDistance).assertEqual(metaData!.exifMetadata!.gpsDestDistance);
          expect(New_metaData!.gpsProcessingMethod).assertEqual(metaData!.exifMetadata!.gpsProcessingMethod);
          expect(New_metaData!.gpsAreaInformation).assertEqual(metaData!.exifMetadata!.gpsAreaInformation);
          expect(New_metaData!.gpsDateStamp).assertEqual(metaData!.exifMetadata!.gpsDateStamp);
          expect(New_metaData!.gpsDifferential).assertEqual(metaData!.exifMetadata!.gpsDifferential);
          expect(New_metaData!.gpsHPositioningError).assertEqual(metaData!.exifMetadata!.gpsHPositioningError);
          expect(New_metaData!.isoSpeedRatings).assertEqual(metaData!.exifMetadata!.isoSpeedRatings);
          expect(New_metaData!.photographicSensitivity).assertDeepEquals(metaData!.exifMetadata!.photographicSensitivity);
          expect(New_metaData!.oecf).assertDeepEquals(metaData!.exifMetadata!.oecf);
          expect(New_metaData!.sensitivityType).assertEqual(metaData!.exifMetadata!.sensitivityType);
          expect(New_metaData!.standardOutputSensitivity).assertEqual(metaData!.exifMetadata!.standardOutputSensitivity);
          expect(New_metaData!.recommendedExposureIndex).assertEqual(metaData!.exifMetadata!.recommendedExposureIndex);
          expect(New_metaData!.isoSpeedLatitudeyyy).assertEqual(metaData!.exifMetadata!.isoSpeedLatitudeyyy);
          expect(New_metaData!.isoSpeedLatitudezzz).assertEqual(metaData!.exifMetadata!.isoSpeedLatitudezzz);
          expect(New_metaData!.exifVersion).assertEqual(metaData!.exifMetadata!.exifVersion);
          expect(New_metaData!.dateTimeOriginal).assertEqual(metaData!.exifMetadata!.dateTimeOriginal);
          expect(New_metaData!.dateTimeDigitized).assertEqual(metaData!.exifMetadata!.dateTimeDigitized);
          expect(New_metaData!.offsetTime).assertEqual(metaData!.exifMetadata!.offsetTime);
          expect(New_metaData!.offsetTimeOriginal).assertEqual(metaData!.exifMetadata!.offsetTimeOriginal);
          expect(New_metaData!.offsetTimeDigitized).assertEqual(metaData!.exifMetadata!.offsetTimeDigitized);
          expect(New_metaData!.componentsConfiguration).assertEqual(metaData!.exifMetadata!.componentsConfiguration);
          expect(New_metaData!.compressedBitsPerPixel).assertEqual(metaData!.exifMetadata!.compressedBitsPerPixel);
          expect(New_metaData!.shutterSpeedValue).assertEqual(metaData!.exifMetadata!.shutterSpeedValue);
          expect(New_metaData!.apertureValue).assertEqual(metaData!.exifMetadata!.apertureValue);
          expect(New_metaData!.brightnessValue).assertEqual(metaData!.exifMetadata!.brightnessValue);
          expect(New_metaData!.exposureBiasValue).assertEqual(metaData!.exifMetadata!.exposureBiasValue);
          expect(New_metaData!.maxApertureValue).assertEqual(metaData!.exifMetadata!.maxApertureValue);
          expect(New_metaData!.subjectDistance).assertEqual(metaData!.exifMetadata!.subjectDistance);
          expect(New_metaData!.meteringMode).assertEqual(metaData!.exifMetadata!.meteringMode);
          expect(New_metaData!.lightSource).assertEqual(metaData!.exifMetadata!.lightSource);
          expect(New_metaData!.flash).assertEqual(metaData!.exifMetadata!.flash);
          expect(New_metaData!.focalLength).assertEqual(metaData!.exifMetadata!.focalLength);
          expect(New_metaData!.subjectArea).assertDeepEquals(metaData!.exifMetadata!.subjectArea);
          expect(New_metaData!.makerNote).assertDeepEquals(metaData!.exifMetadata!.makerNote);
          expect(New_metaData!.userComment).assertEqual(metaData!.exifMetadata!.userComment);
          expect(New_metaData!.subsecTime).assertEqual(metaData!.exifMetadata!.subsecTime);
          expect(New_metaData!.subsecTimeOriginal).assertEqual(metaData!.exifMetadata!.subsecTimeOriginal);
          expect(New_metaData!.subsecTimeDigitized).assertEqual(metaData!.exifMetadata!.subsecTimeDigitized);
          expect(New_metaData!.flashpixVersion).assertEqual(metaData!.exifMetadata!.flashpixVersion);
          expect(New_metaData!.colorSpace).assertEqual(metaData!.exifMetadata!.colorSpace);
          expect(New_metaData!.pixelXDimension).assertEqual(metaData!.exifMetadata!.pixelXDimension);
          expect(New_metaData!.pixelYDimension).assertEqual(metaData!.exifMetadata!.pixelYDimension);
          expect(New_metaData!.relatedSoundFile).assertEqual(metaData!.exifMetadata!.relatedSoundFile);
          expect(New_metaData!.flashEnergy).assertEqual(metaData!.exifMetadata!.flashEnergy);
          expect(New_metaData!.spatialFrequencyResponse).assertDeepEquals(metaData!.exifMetadata!.spatialFrequencyResponse);
          expect(New_metaData!.focalPlaneXResolution).assertEqual(metaData!.exifMetadata!.focalPlaneXResolution);
          expect(New_metaData!.focalPlaneYResolution).assertEqual(metaData!.exifMetadata!.focalPlaneYResolution);
          expect(New_metaData!.focalPlaneResolutionUnit).assertEqual(metaData!.exifMetadata!.focalPlaneResolutionUnit);
          expect(New_metaData!.subjectLocation).assertDeepEquals(metaData!.exifMetadata!.subjectLocation);
          expect(New_metaData!.exposureIndex).assertEqual(metaData!.exifMetadata!.exposureIndex);
          expect(New_metaData!.sensingMethod).assertEqual(metaData!.exifMetadata!.sensingMethod);
          expect(New_metaData!.fileSource).assertDeepEquals(metaData!.exifMetadata!.fileSource);
          expect(New_metaData!.sceneType).assertDeepEquals(metaData!.exifMetadata!.sceneType);
          expect(New_metaData!.cfaPattern).assertDeepEquals(metaData!.exifMetadata!.cfaPattern);
          expect(New_metaData!.customRendered).assertEqual(metaData!.exifMetadata!.customRendered);
          expect(New_metaData!.exposureMode).assertEqual(metaData!.exifMetadata!.exposureMode);
          expect(New_metaData!.whiteBalance).assertEqual(metaData!.exifMetadata!.whiteBalance);
          expect(New_metaData!.digitalZoomRatio).assertEqual(metaData!.exifMetadata!.digitalZoomRatio);
          expect(New_metaData!.focalLengthIn35mmFilm).assertEqual(metaData!.exifMetadata!.focalLengthIn35mmFilm);
          expect(New_metaData!.sceneCaptureType).assertEqual(metaData!.exifMetadata!.sceneCaptureType);
          expect(New_metaData!.gainControl).assertEqual(metaData!.exifMetadata!.gainControl);
          expect(New_metaData!.contrast).assertEqual(metaData!.exifMetadata!.contrast);
          expect(New_metaData!.saturation).assertEqual(metaData!.exifMetadata!.saturation);
          expect(New_metaData!.sharpness).assertEqual(metaData!.exifMetadata!.sharpness);
          expect(New_metaData!.deviceSettingDescription).assertDeepEquals(metaData!.exifMetadata!.deviceSettingDescription);
          expect(New_metaData!.subjectDistanceRange).assertEqual(metaData!.exifMetadata!.subjectDistanceRange);
          expect(New_metaData!.imageUniqueId).assertEqual(metaData!.exifMetadata!.imageUniqueId);
          expect(New_metaData!.cameraOwnerName).assertEqual(metaData!.exifMetadata!.cameraOwnerName);
          expect(New_metaData!.bodySerialNumber).assertEqual(metaData!.exifMetadata!.bodySerialNumber);
          expect(New_metaData!.lensSpecification).assertDeepEquals(metaData!.exifMetadata!.lensSpecification);
          expect(New_metaData!.lensMake).assertEqual(metaData!.exifMetadata!.lensMake);
          expect(New_metaData!.lensModel).assertEqual(metaData!.exifMetadata!.lensModel);
          expect(New_metaData!.lensSerialNumber).assertEqual(metaData!.exifMetadata!.lensSerialNumber);
          expect(New_metaData!.compositeImage).assertEqual(metaData!.exifMetadata!.compositeImage);
          expect(New_metaData!.sourceImageNumberOfCompositeImage).assertDeepEquals(metaData!.exifMetadata!.sourceImageNumberOfCompositeImage);
          expect(New_metaData!.sourceExposureTimesOfCompositeImage).assertDeepEquals(metaData!.exifMetadata!.sourceExposureTimesOfCompositeImage);
          expect(New_metaData!.gamma).assertEqual(metaData!.exifMetadata!.gamma);
          expect(New_metaData!.jpegInterchangeFormat).assertEqual(metaData!.exifMetadata!.jpegInterchangeFormat);
          expect(New_metaData!.jpegInterchangeFormatLength).assertEqual(metaData!.exifMetadata!.jpegInterchangeFormatLength);
        }
        done();
      } catch (error) {
        console.error(TAG, testName, `Failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
    });

  });
}