using UnityEngine;
 
[ExecuteInEditMode]
public class GetPlayerPos : MonoBehaviour
{
    public GameObject player;
    public Material material;
    // Start is called before the first frame update
    void Start()
    {
 
    }
 
    // Update is called once per frame
    void Update()
    {
        material.SetVector("_PlayerPos", player.transform.position);
 
    }
}
 
 
//LZX completed this script in 2024/05/06
//LZX-TC-VS-2024-05-05-001