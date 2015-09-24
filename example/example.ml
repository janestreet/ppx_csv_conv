open Core.Std

module Date = struct
  include Date
  include (Csvfields.Csv.Atom (Date) : Csvfields.Csv.Csvable with type t := t)
end

type t = {
  a : float;
  b : string;
  c : int;
  e : Date.t;
} [@@deriving csv, fields]

