import bmsZlibChecksumTest from './BmsZlibChecksum.test';
import bmsZlibChecksumAdler32Test from './BmsZlibChecksumAdler32.test';
import bmsZlibChecksumAdler32CombineTest from './BmsZlibChecksumAdler32Combine.test';
import bmsZlibChecksumCrc32Test from './BmsZlibChecksumCrc32.test';
import bmsZlibChecksumCrc32CombineTest from './BmsZlibChecksumCrc32Combine.test';
import bmsZlibChecksumCrc64Test from './BmsZlibChecksumCrc64.test';
import decompressFileTest from './DecompressFile.test';

export default function testsuite() {
  bmsZlibChecksumTest();
  bmsZlibChecksumAdler32Test();
  bmsZlibChecksumAdler32CombineTest();
  bmsZlibChecksumCrc32Test();
  bmsZlibChecksumCrc32CombineTest();
  bmsZlibChecksumCrc64Test();
  decompressFileTest();
}
