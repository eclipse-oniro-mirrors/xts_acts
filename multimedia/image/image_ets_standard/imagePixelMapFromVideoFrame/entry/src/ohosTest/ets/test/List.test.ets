import image10bitPixelMapFetchFrame from './TenBitPixelMapFetchFrame.test';
import pictureFetchFrame from './PictureFetchFrame.test';
import pixelMapSupportYuvFetchFrame from './PixelMapSupportYuvFetchFrame.test';

export default function testsuite() {
  image10bitPixelMapFetchFrame();
  pictureFetchFrame();
  pixelMapSupportYuvFetchFrame();
}