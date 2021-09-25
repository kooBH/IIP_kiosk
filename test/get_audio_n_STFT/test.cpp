#include "STFT.h"
#include "WAV.h"
#include "RtInput.h"

/* Set Parameter of Input */
constexpr int device = 6;
constexpr int ch = 4;
constexpr int sr = 16000;
constexpr int frame = 512;
constexpr int shift = 128;

int main() {
  /* Define Algortihm Class here */

  int length;
  WAV output(ch, sr);
  STFT process(ch, frame, shift);
  RtInput input(device,ch,sr,shift,frame);

  short buf_in[ch * shift];
  double** data;
  short buf_out[ch * shift];
  double** raw_in;

  raw_in = new double* [ch];
  for (int i = 0; i <ch; i++) {
    raw_in[i] = new double[shift];
    memset(raw_in[i], 0, sizeof(double) * shift);
  }

  data = new double* [ch];
  for (int i = 0; i < ch; i++) {
    data[i] = new double[frame + 2];
    memset(data[i], 0, sizeof(double) * (frame + 2));
  }

  output.NewFile("output.wav");
  input.Start();

  printf("Running . . .\n");
  // Run indefinitely, must quit manually
  while(1){
    if (input.data.stock.load() > shift) {
      input.Convert2Array(raw_in);
      process.stft(raw_in, data);

      process.istft(data, buf_out);
      output.Append(buf_out, shift * ch);
    }
    else {
      SLEEP(100);
    }
  }
  return 0;
}