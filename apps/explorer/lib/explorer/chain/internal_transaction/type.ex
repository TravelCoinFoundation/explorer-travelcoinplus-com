defmodule Explorer.Chain.InternalTransaction.Type do
  @moduledoc """
  Internal transaction types
  """

  @behaviour Ecto.Type

  @typedoc """
   * `:call`
   * `:create`
   * `:reward`
   * `:selfdestruct`
  """
  @type t :: :call | :create | :reward | :selfdestruct

  @doc """
  Casts `term` to `t:t/0`

  If the `term` is already in `t:t/0`, then it is returned

      iex> Explorer.Chain.InternalTransaction.Type.cast(:call)
      {:ok, :call}
      iex> Explorer.Chain.InternalTransaction.Type.cast(:create)
      {:ok, :create}
      iex> Explorer.Chain.InternalTransaction.Type.cast(:reward)
      {:ok, :reward}
      iex> Explorer.Chain.InternalTransaction.Type.cast(:selfdestruct)
      {:ok, :selfdestruct}

  If `term` is a `String.t`, then it is converted to the corresponding `t:t/0`.

      iex> Explorer.Chain.InternalTransaction.Type.cast("call")
      {:ok, :call}
      iex> Explorer.Chain.InternalTransaction.Type.cast("create")
      {:ok, :create}
      iex> Explorer.Chain.InternalTransaction.Type.cast("reward")
      {:ok, :reward}
      iex> Explorer.Chain.InternalTransaction.Type.cast("selfdestruct")
      {:ok, :selfdestruct}

  Unsupported `String.t` return an `:error`.

      iex> Explorer.Chain.InternalTransaction.Type.cast("hard-fork")
      :error

  """
  @impl Ecto.Type
  @spec cast(term()) :: {:ok, t()} | :error
  def cast(t) when t in ~w(call create selfdestruct reward)a, do: {:ok, t}
  def cast("call"), do: {:ok, :call}
  def cast("create"), do: {:ok, :create}
  def cast("reward"), do: {:ok, :reward}
  def cast("selfdestruct"), do: {:ok, :selfdestruct}
  def cast(_), do: :error

  @doc """
  Dumps the `atom` format to `String.t` format used in the database.

      iex> Explorer.Chain.InternalTransaction.Type.dump(:call)
      {:ok, "call"}
      iex> Explorer.Chain.InternalTransaction.Type.dump(:create)
      {:ok, "create"}
      iex> Explorer.Chain.InternalTransaction.Type.dump(:reward)
      {:ok, "reward"}
      iex> Explorer.Chain.InternalTransaction.Type.dump(:selfdestruct)
      {:ok, "selfdestruct"}

  Other atoms return an error

      iex> Explorer.Chain.InternalTransaction.Type.dump(:other)
      :error

  """
  @impl Ecto.Type
  @spec dump(term()) :: {:ok, String.t()} | :error
  def dump(:call), do: {:ok, "call"}
  def dump(:create), do: {:ok, "create"}
  def dump(:reward), do: {:ok, "reward"}
  def dump(:selfdestruct), do: {:ok, "selfdestruct"}
  def dump(_), do: :error

  @doc """
  Loads the `t:String.t/0` from the database.

      iex> Explorer.Chain.InternalTransaction.Type.load("call")
      {:ok, :call}
      iex> Explorer.Chain.InternalTransaction.Type.load("create")
      {:ok, :create}
      iex> Explorer.Chain.InternalTransaction.Type.load("reward")
      {:ok, :reward}
      iex> Explorer.Chain.InternalTransaction.Type.load("selfdestruct")
      {:ok, :selfdestruct}

  Other `t:String.t/0` return `:error`

      iex> Explorer.Chain.InternalTransaction.Type.load("other")
      :error

  """
  @impl Ecto.Type
  @spec load(term()) :: {:ok, t()} | :error
  def load("call"), do: {:ok, :call}
  def load("create"), do: {:ok, :create}
  def load("reward"), do: {:ok, :reward}
  def load("selfdestruct"), do: {:ok, :selfdestruct}
  def load(_), do: :error

  @doc """
  The underlying database type: `:string`
  """
  @impl Ecto.Type
  @spec type() :: :string
  def type, do: :string
end
