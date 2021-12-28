import chisel3._
import chisel3.stage.ChiselStage
import chisel3.util.Counter

class Blinky extends Module {
  val led1, led2, led3, led4, led5 = IO(Output(Bool()))

  val CLOCK_HZ = 12_000_000 // 12 MHz
  val (counter, _) = Counter(0 until CLOCK_HZ)

  led1 := false.B
  led2 := false.B
  led3 := false.B
  led4 := false.B
  led5 := (counter > (CLOCK_HZ / 2).U)
}

// This part generates the Verilog.
object Blinky extends App {
  (new ChiselStage).emitVerilog(new Blinky, args)
}
